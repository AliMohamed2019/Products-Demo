//
//  CustomError.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import Foundation
import SwiftUI

enum CustomError: Error {
    
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case genaricError
    
    var alertContext: AlertItem {
        
        switch self {
            case .invalidURL:
                return AlertItem(title: Text("Server Error"),
                                 message: Text("The data received from the server was invalid."),
                                 dismissButton: .default(Text("OK")))
            case .invalidResponse:
                return AlertItem(title: Text("Server Error"),
                                 message: Text("Invalid response from the server. Please try again later or contact support."),
                                 dismissButton: .default(Text("OK")))
            case .invalidData:
                return AlertItem(title: Text("Sever Error"),
                                 message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                 dismissButton: .default(Text("OK")))
            case .unableToComplete:
                return AlertItem(title: Text("Server Error"),
                                 message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                 dismissButton: .default(Text("OK")))
            case .genaricError:
                return AlertItem(title: Text("Something Went Wrong"),
                                 message: Text("An unexpected error occurred. Please try again later."),
                                 dismissButton: .default(Text("OK")))
        }
    }
}
