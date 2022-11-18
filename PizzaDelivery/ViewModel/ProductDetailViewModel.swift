//
//  ProductDetailViewModel.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import Foundation

class ProductDetailViewModel : ObservableObject {
    
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
}
