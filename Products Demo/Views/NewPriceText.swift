//
//  NewPriceText.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct NewPriceText: View {
    let price: Double
    
    var body: some View {
        Text("EGP \(price, specifier: "%.3f")")
            .font(.title2)
        .fontWeight(.semibold)
    }
}

struct NewPriceText_Previews: PreviewProvider {
    static var previews: some View {
        NewPriceText(price: 40.0)
    }
}
