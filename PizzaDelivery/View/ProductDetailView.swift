//
//  ProductDetailView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel: ProductDetailViewModel
    @State var size: PizzaSize = .Small
    @State var quantity = 1
    @Environment(\.presentationMode) var presentationMode
    
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
                    .padding(.vertical, 1)
                    .padding(.horizontal, 30)
            }
            Picker("Size", selection: $size) {
                ForEach(PizzaSize.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.segmented)
                .padding()
            
            HStack {
                Stepper("Quantity", value: $quantity, in: 1...10)
                Text("\(self.quantity)").padding(.horizontal, 16)
            }.padding(.horizontal, 30)
            
            Button {
                var position = Position(id: UUID().uuidString, product: viewModel.product, quantity: self.quantity)
                position.product.price = size.getPrice(pizzaSize: self.size, product: viewModel.product)
                CardViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Add to card")
                    .font(.system(size: 15, weight: .bold))
                    .frame(maxWidth: .maximum(150, 125))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("buttonColor"))
                    .cornerRadius(16)
                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                    .padding(.top, 13)
            }
            Spacer()

        }
        .padding(.top, 70)
        .ignoresSafeArea()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: 1, title: "Pizza", description: "A delicious pizza has an intensely cheesy flavor. The combination of tomato sauce and cheese creates a perfect marriage of flavor.", price: 10, imageUrl: "404")))
    }
}
