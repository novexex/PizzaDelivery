//
//  CardViewModel.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/19/22.
//

import Foundation

class CardViewModel: ObservableObject {
    
    static let shared = CardViewModel()
    
    private init() {}
    
    @Published var positions = [Position]()
    
    var costSumm: Int {
        var sum = 0
        for pos in positions {
            sum += pos.cost
        }
        return sum
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
