//
//  ProductDetailView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var size: PizzaSize = .Small
    
    var body: some View {
        VStack {
            Image("pizzaImage")
                .resizable()
                .frame(width: 400, height: 360)
            VStack(alignment: .leading) {
                HStack {
                    Text("\(viewModel.product.title)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                    Spacer()
                    Text("\(size.getPrice(pizzaSize: size, product: viewModel.product)) $")
                        .font(.system(size: 25, weight: .regular, design: .default))
                }.padding(.horizontal, 30)
                Text("\(viewModel.product.description)")
                    .padding(30)
            }
            Picker("Size", selection: $size) {
                ForEach(PizzaSize.allCases, id: \.rawValue) { item in
                    Text(item.rawValue)
                }
            }//.pickerStyle(.segmented)
            Spacer()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: 1, title: "Pizza", description: "Pizza_discr", price: 10, imageUrl: "404")))
    }
}
