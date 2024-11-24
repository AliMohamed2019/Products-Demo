//
//  ImageLoader.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    @Published var isLoading = false
    
    func load(fromURLString urlString: String) {
        isLoading = true
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { [weak self] uiImage in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let uiImage = uiImage {
                    self?.image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var placeholder: String = "placeholder"
    
    var body: some View {
        image?
            .resizable()
            .scaledToFill() ?? Image(placeholder)
            .resizable()
            .scaledToFill()
    }
}

struct ProductRemoteImage: View {
    
    @StateObject private var imageLoader = ImageLoader()
    let urlString: String
    var placeholder: String = "placeholder"
    
    var body: some View {
        ZStack {
            RemoteImage(image: imageLoader.image, placeholder: placeholder)
            
            if imageLoader.isLoading {
                ProgressView()
                    .tint(.gray)
            }
        }
        .onAppear {
            imageLoader.load(fromURLString: urlString)
        }
    }
}
