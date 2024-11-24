//
//  ImageCarouselWithIndicator.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct ImageCarouselWithIndicator: View {
    
    let images: [String]
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    ProductRemoteImage(urlString: images[index])
                        .aspectRatio(contentMode: .fit)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .foregroundColor(.primaryColor)
        }
    }

}

struct ImageCarouselWithIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselWithIndicator(images: [])
    }
}
