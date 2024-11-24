//
//  StrikeThroughPriceText.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct StrikeThroughPriceText: View {
    
    let price: Double
    let discountPercentage: Double
    
    var body: some View {
        Text("EGP \(price + (price * discountPercentage / 100) , specifier: "%.3f")")
            .foregroundColor(Color(.lightGray))
            .strikethrough()
    }
    
}

struct StrikeThroughPriceText_Previews: PreviewProvider {
    static var previews: some View {
        StrikeThroughPriceText(price: 10.00, discountPercentage: 50)
    }
}
