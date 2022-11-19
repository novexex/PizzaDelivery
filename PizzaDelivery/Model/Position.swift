//
//  Position.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/19/22.
//

import Foundation

struct Position: Identifiable {
    var id: String
    var product: Product
    var quantity: Int
    
    var cost: Int {
        return product.price * quantity
    }
}
