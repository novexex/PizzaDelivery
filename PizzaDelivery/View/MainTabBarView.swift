//
//  MainTabBar.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            
            NavigationView {
                MenuView()
            }
                .tabItem {
                    VStack {
                        Image(systemName: "menucard")
                        Text("Menu")
                    }
                }
            CartView(viewModel: CardViewModel.shared)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                }
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
