//
//  ProfileView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/18/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isQuitAlertPresented = false
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("defaultProfileImage")
                    .resizable()
                    .frame(width: 80, height: 80)
                VStack {
                    Text("userName")
                        .font(.system(size: 30, weight: .bold, design: .default))
                    Text("userPhoneNumber")
                        .font(.system(size: 20, weight: .regular, design: .default))
                }
                
            }.padding()
            Text("Your orders:")
                .padding()
            List {
                Text("orderTest1")
                Text("orderTest2")
                Text("orderTest3")
                Text("orderTest4")
                Text("orderTest5")
            }
            Button {
                print("logout")
            } label: {
                Text("Logout")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                    .foregroundColor(.black)
                    .padding()
            }.alert("Are you sure you want to logout?", isPresented: $isQuitAlertPresented) {
                Button("Yes") {}
                Button("No", role: .cancel) {}
            }

        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
