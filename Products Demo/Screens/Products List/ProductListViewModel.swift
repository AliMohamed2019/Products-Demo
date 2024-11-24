//
//  ProductListViewModel.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import Foundation
import Combine

@MainActor final class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var filterCategory: Category? {
        didSet {
            fetchCategoryProduct()
        }
    }
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isFetching = false
    private var noMoreData: Bool = false
    
    private(set) var currentPage = 0
    private var pageSize: Int = 10
    
    // MARK: - Init
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    // MARK: - Methods
    func toggleLoading(isLoading: Bool) {
        if currentPage == 0 {
            self.isLoading = isLoading
        } else {
            isFetching = isLoading
        }
    }
    
    func fetchProducts(reset: Bool = false) async {
        guard !isFetching else { return }
        
        if reset {
            currentPage = 0
            products = []
            noMoreData = false
        }
        
        toggleLoading(isLoading: true)
        
        do {
            let newProducts = try await networkManager.fetchProducts(page: currentPage,
                                                                     limit: pageSize,
                                                                     category: filterCategory?.rawValue)
            toggleLoading(isLoading: false)
            products.append(contentsOf: newProducts)
            noMoreData = newProducts.count < pageSize
            currentPage += 1
        } catch {
            toggleLoading(isLoading: false)
            
            if let error = error as? CustomError {
                alertItem = error.alertContext
            } else {
                alertItem = CustomError.genaricError.alertContext
            }
            
        }
        
    }
    
    func loadMoreProductsIfNeeded(currentProduct: Product) async {
        guard noMoreData == false else { return }
        guard let lastProduct = products.last else { return }
        if currentProduct.id == lastProduct.id {
            await fetchProducts()
        }
    }
    
    private func fetchCategoryProduct() {
        Task {
            await fetchProducts(reset: true)
            
        }
    }
}
