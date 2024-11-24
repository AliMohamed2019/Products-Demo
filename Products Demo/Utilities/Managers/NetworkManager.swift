//
//  NetworkManager.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import UIKit

struct NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    var session: NetworkSession
    private init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    private let baseURL = "https://dummyjson.com/"
    private var productsURL: String { "\(baseURL)products" }
    private var categoryProductsURL: String { "\(baseURL)products/category" }
    
    // Fetch Products
    func fetchProducts(page: Int, limit: Int = 10, category: String? = "beauty") async throws -> [Product] {
        let requestURL = makeRequestURL(page: page, limit: limit, category: category)
        
        guard let url = URL(string: requestURL) else {
            throw CustomError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw CustomError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ProductResponse.self, from: data).products
        } catch {
            throw CustomError.invalidData
        }
    }
    
    // Create Request
    private func makeRequestURL(page: Int, limit: Int, category: String?) -> String {
        let baseRequestURL = category == nil ? productsURL : "\(categoryProductsURL)/\(category!)"
        return "\(baseRequestURL)?limit=\(limit)&skip=\(page * limit)"
    }
    
    // Download Image from URL String
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = urlString
        
        if let cachedImage = cache.object(forKey: NSString(string: cacheKey)) {
            completed(cachedImage)
            return
        }

        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        

        let task = session.dataTask(with: url) { data, response, error in
            
            if let data, let image = UIImage(data: data) {
                self.cache.setObject(image, forKey: NSString(string: cacheKey))
                completed(image)
            } else {
                completed(nil)
            }
        }
        task.resume()
    }
}



