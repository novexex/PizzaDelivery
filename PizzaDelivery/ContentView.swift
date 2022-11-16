//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background").resizable()
                .scaledToFit()
                .frame(width: 1000, height: 1000)
                .position(x: 450, y: 500)
                .ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
