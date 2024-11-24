//
//  NetworkSession.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import Foundation

protocol NetworkSession {
    func dataTask(with url: URL, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: NetworkSession { }
