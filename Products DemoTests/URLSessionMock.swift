//
//  URLSessionMock.swift
//  Products DemoTests
//
//  Created by Ali Mohamed on 24/11/2024.
//

import XCTest
@testable import Products_Demo

class MockNetworkSession: NetworkSession {
    var data: Data?
    var error: Error?
    var response: URLResponse?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.data, self.response, self.error)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
