//
//  RatingView.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    let maxRating: Int = 5
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(0..<maxRating, id: \.self) { index in
                if Double(index) + 1 <= rating {
                    // Fully filled star
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else if Double(index) + 0.5 <= rating {
                    // Half-filled star
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                } else {
                    // Empty star
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 3)
    }
}
