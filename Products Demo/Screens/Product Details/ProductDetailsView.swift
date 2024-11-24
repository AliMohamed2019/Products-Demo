//
//  ProductDetailsView.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.brand ?? "N/A")
                        .font(.subheadline)
                    
                    Text(product.title)
                        .lineLimit(2)
                        .font(.headline)
                    
                    Text("SKU: \(product.sku)")
                        .font(.footnote)
                        .foregroundColor(Color(.label))
                    
                }
                
                ImageCarouselWithIndicator(images: product.images)
                    .frame(height: 250)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    NewPriceText(price: product.price)
                    
                    HStack(spacing: 12) {
                        Text("Sale")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                        
                        StrikeThroughPriceText(price: product.price, discountPercentage: product.discountPercentage)
                            .font(.subheadline)
                        
                    }
                    
                    Divider()
                        .background(.gray)
                        .padding(8)
                    
                    HStack{
                        Text(product.availabilityStatus)
                            .font(.caption2)
                            .fontWeight(.medium)
                            .padding(5)
                            .background(Color(.lightGray.withAlphaComponent(0.7)))
                            .cornerRadius(6)
                        
                        Spacer()
                        
                        Text("Warranty: \(product.warrantyInformation)")
                            .font(.caption2)
                            .fontWeight(.medium)
                    }
                    .padding(.bottom)
                    
                    
                    HStack(spacing: 70) {
                        ProductInfo(image: Image(systemName: "creditcard.circle"),
                                    content: "Cash or Card",
                                    desc: "Payment")
                        
                        ProductInfo(image: Image(systemName: "repeat.circle"),
                                    content: product.returnPolicy,
                                    desc: "Return Policy")
                        
                    }
                    .padding(.bottom)
                    
                }
                .padding()
                
                VStack(alignment: .leading) {
                    
                    Text("Description")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    Text(product.description)
                        .font(.caption)
                        .padding()
                }
                
            }
            .padding()
        }
        .navigationTitle(product.title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: ProductMockData.productSample)
    }
}

// MARK: - Product info view
struct ProductInfo: View {
    
    let image: Image
    let content: String
    let desc: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            image
            
            Text(content)
                .fontWeight(.light)
                .font(.caption)
            
            Text(desc)
                .fontWeight(.semibold)
                .font(.caption2)
        }
    }
    
}
