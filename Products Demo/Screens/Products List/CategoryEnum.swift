//
//  CategoryEnum.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import Foundation

enum Category: String {
    case beauty = "beauty"
    case fragrances = "fragrances"
    
    var title: String {
        switch self {
        case .beauty:
            return "Beauty"
            
        case .fragrances:
            return "Fragrances"
        }
    }
}
