//
//  ProductListView.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        FilterButtons(viewModel: viewModel)
                        
                        Divider()
                            .background(Color.primaryColor)
                            .padding(.horizontal)
                        
                        Text("^[\(viewModel.products.count) result](inflect: true)")
                            .font(.subheadline)
                            .padding(.leading)
                    }
                    
                    List(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailsView(product: product)) {
                            ProductListCell(product: product)
                                .padding(.bottom)
                        }
                        .onAppear {
                            Task {
                                await viewModel.loadMoreProductsIfNeeded(currentProduct: product)
                            }
                        }
                    }
                    .navigationTitle("Products Title")
                    
                    if viewModel.isFetching {
                        ProgressView("Fetching more products...")
                            .frame(height: 70)
                    }
                }
            }
            .tint(Color(.label))
            .task {
                Task {
                    await viewModel.fetchProducts(reset: true)
                }
            }
            
            if viewModel.isLoading {
                ProgressView("Loading...")
            }
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}


// MARK: - Filter Buttons
struct FilterButtons: View {
    @ObservedObject var viewModel: ProductListViewModel
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach([Category.beauty, Category.fragrances], id: \.self) { category in
                BorderedButton(
                    title: category.title,
                    isSelected: Binding(
                        get: { viewModel.filterCategory == category },
                        set: { newValue in
                            viewModel.filterCategory = newValue ? category : nil
                        })) {
                            viewModel.filterCategory = viewModel.filterCategory == category ? nil : category
                        }
            }
        }
        .padding(.leading)
    }
}
