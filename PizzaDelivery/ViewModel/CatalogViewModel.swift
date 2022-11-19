//
//  CatalogViewModel.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import Foundation

class CatalogViewModel: ObservableObject {

    static let shared = CatalogViewModel()

    var products = [
        Product(id: 1, title: "Pizza1", description: "Pizza_disc1", price: 10, imageUrl: "404"),
        Product(id: 2, title: "Pizza2", description: "Pizza_disc2", price: 15, imageUrl: "404"),
        Product(id: 3, title: "Pizza3", description: "Pizza_disc3", price: 10, imageUrl: "404"),
        Product(id: 4, title: "Pizza4", description: "Pizza_disc4", price: 10, imageUrl: "404"),
        Product(id: 5, title: "Pizza5", description: "Pizza_disc5", price: 10, imageUrl: "404")]
    
    var products2 = [
        Product(id: 1, title: "Pizza1", description: "A delicious pizza has an intensely cheesy flavor. The combination of tomato sauce and cheese creates a perfect marriage of flavor.", price: 10, imageUrl: "404"),
        Product(id: 2, title: "Pizza2", description: "Pizza_disc2", price: 15, imageUrl: "404"),
        Product(id: 3, title: "Pizza3", description: "Pizza_disc3", price: 10, imageUrl: "404"),
        Product(id: 4, title: "Pizza4", description: "Pizza_disc4", price: 10, imageUrl: "404"),
        Product(id: 5, title: "Pizza5", description: "Pizza_disc5", price: 10, imageUrl: "404")]

}
