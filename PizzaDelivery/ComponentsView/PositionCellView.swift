//
//  PositionCellView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/19/22.
//

import SwiftUI

struct PositionCellView: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.quantity) items")
            Text("\(position.cost) $")
                .frame(width: 65, alignment: .trailing)
        }.padding(.horizontal)
    }
}

struct PositionCellView_Previews: PreviewProvider {
    static var previews: some View {
        PositionCellView(position: Position(id: UUID().uuidString, product: Product(id: 1, title: "Peperroni", description: "A delicious pizza has an intensely cheesy flavor. The combination of tomato sauce and cheese creates a perfect marriage of flavor.", price: 10, imageUrl: "404"), quantity: 3))
    }
}
