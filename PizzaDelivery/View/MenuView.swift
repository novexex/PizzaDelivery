//
//  CatalogView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import SwiftUI

struct MenuView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("test section") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout) {
                        ForEach(CatalogViewModel.shared.products, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCellView(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
                
            }
            
            Section("test section2") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout) {
                        ForEach(CatalogViewModel.shared.products2, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCellView(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
            }
            
        }.navigationTitle("Menu")
        
        
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
