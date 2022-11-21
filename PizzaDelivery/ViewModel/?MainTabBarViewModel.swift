//
//  MainTabBarViewModel.swift
//  PizzaDelivery
//
//  Created by Артур Ильясов on 21.11.2022.
//

import Foundation
import Firebase

class MainTabBarViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
