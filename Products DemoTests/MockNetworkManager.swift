//
//  MockNetworkManager.swift
//  Products DemoTests
//
//  Created by Ali Mohamed on 24/11/2024.
//

import XCTest
@testable import Products_Demo

class MockNetworkManager: NetworkManagerProtocol {
    var mockProducts: [Product] = []
    var shouldThrowError: Bool = false
    var errorToThrow: CustomError = .invalidURL
    
    func fetchProducts(page: Int, limit: Int, category: String?) async throws -> [Product] {
        if shouldThrowError {
            throw errorToThrow
        }
        return mockProducts
    }
}
