//
//  NetworkManagerProtocol.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchProducts(page: Int, limit: Int, category: String?) async throws -> [Product]
}
