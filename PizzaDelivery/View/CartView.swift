//
//  CartView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CardViewModel
    
    var body: some View {
        VStack {
            List(viewModel.positions) { position in
                PositionCellView(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Remove")
                        }.tint(.red)
                    }
            }.listStyle(.plain)
                .navigationTitle("Card")
            
            HStack {
                Text("Order amount:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(viewModel.costSumm) $")
                    .fontWeight(.bold)
            }.padding()
            
            HStack {
                
                Button {
                    print("ordered")
                } label: {
                    Text("Order")
                        .font(.system(size: 15, weight: .bold))
                        .frame(maxWidth: .maximum(150, 125))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("buttonColor"))
                        .cornerRadius(16)
                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                }

            }
            
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CardViewModel.shared)
    }
}
