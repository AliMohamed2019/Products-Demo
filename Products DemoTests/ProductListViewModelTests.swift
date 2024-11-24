//
//  ProductListViewModelTests.swift
//  Products DemoTests
//
//  Created by Ali Mohamed on 24/11/2024.
//

import XCTest
@testable import Products_Demo


@MainActor
class ProductListViewModelTests: XCTestCase {
    var viewModel: ProductListViewModel!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        viewModel = ProductListViewModel(networkManager: mockNetworkManager)
    }
    
    // Product
    func testFetchProductsSuccess() async {
        mockNetworkManager.mockProducts = [ProductMockData.productSample]
        
        await viewModel.fetchProducts()
        
        XCTAssertEqual(viewModel.products.count, 1)
        XCTAssertEqual(viewModel.products.first?.title, "Essence Mascara Lash Princess")
    }
    
    func testFetchProductsReset() async {
        mockNetworkManager.mockProducts = [ProductMockData.productSample]
        
        await viewModel.fetchProducts()
        XCTAssertEqual(viewModel.products.count, 1)
        
        await viewModel.fetchProducts()
        XCTAssertEqual(viewModel.products.count, 2)
        
        await viewModel.fetchProducts(reset: true)
        XCTAssertEqual(viewModel.currentPage, 1)
    }
    
    func testFetchProductsError() async {
        mockNetworkManager.shouldThrowError = true
        mockNetworkManager.errorToThrow = .invalidData
        
        await viewModel.fetchProducts()
        XCTAssertNotNil(viewModel.alertItem)
    }
    
    
    // Pagination
    func testLoadMoreProductsIfNeededSuccess() async {
        mockNetworkManager.mockProducts = ProductMockData.products
        
        await viewModel.fetchProducts()
        
        XCTAssertEqual(viewModel.currentPage, 1)
        await viewModel.loadMoreProductsIfNeeded(currentProduct: viewModel.products.last!)
        XCTAssertEqual(viewModel.currentPage, 2)
    }
    
    func testLoadMoreProductsIfNeededFail() async {
        mockNetworkManager.mockProducts = [ProductMockData.productSample]
        
        await viewModel.fetchProducts()
        
        XCTAssertEqual(viewModel.currentPage, 1)
        await viewModel.loadMoreProductsIfNeeded(currentProduct: viewModel.products.last!)
        XCTAssertEqual(viewModel.currentPage, 1)
    }
}
