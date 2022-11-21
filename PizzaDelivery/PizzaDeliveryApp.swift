//
//  PizzaDeliveryApp.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/16/22.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct PizzaDeliveryApp: App {

    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            print("AppDelegate: didLaunched")
            return true
        }
    }
    
}
