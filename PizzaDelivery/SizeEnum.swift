//
//  SizeEnum.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import Foundation

enum PizzaSize: String, CaseIterable, Identifiable {
    var id: String {
        return self.rawValue
    }

    case Small
    case Medium
    case Large
    
    func getPrice(pizzaSize: PizzaSize, product: Product) -> Int {
        switch pizzaSize {
            case .Small:
                return product.price
            case .Medium:
                return Int(Double(product.price) * 1.25)
            case .Large:
                return Int(Double(product.price) * 1.5)
        }
    }
}
