//
//  NetworkManagerTests.swift
//  Products DemoTests
//
//  Created by Ali Mohamed on 24/11/2024.
//

import XCTest
@testable import Products_Demo

class NetworkManagerTests: XCTestCase {
    var networkManager: NetworkManager!
    var mockSession: MockNetworkSession!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockSession = MockNetworkSession()
        networkManager = NetworkManager.shared
        networkManager.session = mockSession
    }
    
    override func tearDownWithError() throws {
        networkManager = nil
        mockSession = nil
        try super.tearDownWithError()
    }
    
    func testFetchProductsSuccess() async throws {
        // Arrange
        let jsonResponse = """
        {
            "products": [
                {
                    "id": 1,
                    "title": "Essence Mascara Lash Princess",
                    "price": 14.99,
                    "discountPercentage": 9.99,
                    "images": [],
                    "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
                    "rating": 3.0
                    "category": "Beauty",
                    "brand": "Essence",
                    "sku": "RCH45Q1A",
                    "availabilityStatus": "In Stock",
                    "warrantyInformation": "1 month warranty",
                    "returnPolicy": "30 days return policy"
                }
            ]
        }
        """
        mockSession.data = jsonResponse.data(using: .utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: "https://dummyjson.com/")!,
                                               statusCode: 200, httpVersion: nil, headerFields: nil)
        
        networkManager.session = mockSession
        
        // Act
        let newProducts = try await networkManager.fetchProducts(page: 0, limit: 1, category: nil)
        
        // Assert
        XCTAssertEqual(newProducts.count, 1)
        XCTAssertEqual(newProducts.first?.title, "Essence Mascara Lash Princess")
    }
    
    
    func testDownloadImageSuccess() {
        // Arrange
        let imageURL = "https://example.com/images.png"
        let expectedImage = UIImage(named: "placeholder")!
        mockSession.data = expectedImage.pngData()
        mockSession.response = HTTPURLResponse(
            url: URL(string: imageURL)!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        networkManager.session = mockSession
        
        let expectation = self.expectation(description: "Image downloaded successfully")
        
        // Act
        networkManager.downloadImage(fromURLString: imageURL) { image in
            // Assert
            XCTAssertNotNil(image, "Image should not be nil")
            XCTAssertEqual(image?.pngData(), expectedImage.pngData(), "Downloaded image should match expected image")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    
    func testDownloadImageInvalidURL() {
        // Arrange
        let invalidURL = "invalid-url"
        let expectation = self.expectation(description: "Invalid URL handled")
        
        // Act
        networkManager.downloadImage(fromURLString: invalidURL) { image in
            // Assert
            XCTAssertNil(image, "Image should be nil for an invalid URL")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    
    func testDownloadImageFailure() {
        // Arrange
        let imageURL = "https://example.com/image.png"
        mockSession.error = NSError(domain: "NetworkError", code: -1009)
        networkManager.session = mockSession

        let expectation = self.expectation(description: "Network error handled")
        
        // Act
        networkManager.downloadImage(fromURLString: imageURL) { image in
            // Assert
            XCTAssertNil(image, "Image should be nil on network failure")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
