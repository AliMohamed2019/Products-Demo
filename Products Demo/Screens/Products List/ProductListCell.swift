//
//  ProductListCell.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct ProductListCell: View {
    let product: Product
    
    var body: some View {
        HStack {
            ImageCarouselWithIndicator(images: product.images)
                .frame(width: 100, height: 170)
            
            VStack(alignment: .leading) {
                Text(product.category)
                    .font(.callout)
                    .padding(8)
                    .background(Color(.lightGray.withAlphaComponent(0.7)))
                    .cornerRadius(10)
                    .padding(.bottom, 8)
                
                NewPriceText(price: product.price)
                
                HStack(spacing: 12) {
                    Text("Sale")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                    
                    StrikeThroughPriceText(price: product.price,
                                           discountPercentage: product.discountPercentage)
                }
                .padding(.bottom, 8)

                Text(product.title)
                    .lineLimit(2)
                    .font(.headline)
                    .padding(.bottom, 8)

                RatingView(rating: product.rating)
                    .font(.caption)
            }
            .padding(.vertical)
        }
    }
}

struct ProductListCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductListCell(product: ProductMockData.productSample)
    }
}
