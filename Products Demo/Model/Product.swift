//
//  Product.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let category: String
    let images: [String]
    let rating: Double
    let availabilityStatus: String
    let sku: String
    let warrantyInformation: String
    let returnPolicy: String
    let brand: String?
    
}

struct ProductMockData {
    
    static let productSample = Product(id: 1,
                                       title: "Essence Mascara Lash Princess",
                                       description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
                                       price: 14.99,
                                       discountPercentage: 9.99,
                                       category: "Fragrances",
                                       images: ["Test", "Test", "Test"],
                                       rating: 3.0,
                                       availabilityStatus: "In Stock",
                                       sku: "RCH45Q1A",
                                       warrantyInformation: "1 month warranty",
                                       returnPolicy: "30 days return policy",
                                       brand: "Essence")
    
    static let products = [productSample,
                           productSample,
                           productSample,
                           productSample,
                           productSample,
                           productSample,
                           productSample,
                           productSample,
                           productSample,
                           productSample]
}
