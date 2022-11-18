//
//  ProductCellView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import SwiftUI

struct ProductCellView: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            Image("pizzaImage")
                .resizable()
                .frame(maxWidth: screen.width * 0.4, maxHeight: screen.width * 0.4)
            HStack {
                Text(product.title)
                    .font(.system(size: 20, weight: .light, design: .default))
                Spacer()
                Text("\(product.price) $")
                    .font(.system(size: 20, weight: .bold, design: .default))
            }.padding(10)
                .padding(.horizontal, 6)
        }.frame(width: screen.width * 0.45, height: screen.width * 0.5, alignment: .center)
            .padding(.vertical, 8)
            .background()
            .cornerRadius(16)
            .shadow(radius: 6)
            
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product(id: 1, title: "Pizza", description: "Pizza_disc", price: 10, imageUrl: "404"))
    }
}
