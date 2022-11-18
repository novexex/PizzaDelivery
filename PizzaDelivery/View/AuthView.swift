//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Blackwood Martain on 11/16/22.
//

import SwiftUI

struct AuthView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isAuth = true
    
    @State private var isTabViewShow = false
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                TextField("email", text: $email)
                    .padding()
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
                SecureField("password", text: $password)
                    .padding()
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
                if !isAuth {
                    SecureField("confirm password", text: $confirmPassword)
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                }
                
                Button {
                    print(isAuth ? "Sign In pressed" : "Sign Up pressed")
                    isTabViewShow.toggle()
                } label: {
                    Text(isAuth ? "Sign In" : "Sign Up")
                        .font(.system(size: 15, weight: .bold))
                        .frame(maxWidth: .maximum(125, 125))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("buttonColor"))
                        .cornerRadius(16)
                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                }.padding(.top, 15)
                
                Button {
                    print(isAuth ? "Sign Up pressed" : "Sign In pressed")
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Sign Up" : "Sign In")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .shadow(color: Color("buttonColor"), radius: 3, x: 0, y: 0)
                }
                

    
            }.background(Image("pepperoniBg")
                            .resizable()
                            .frame(width: isAuth ? 375 : 380, height: isAuth ? 375 : 380)
                            .opacity(0.85)
                            .offset(y: isAuth ? -15 : 17)
                            .rotationEffect(isAuth ? .degrees(0) : .degrees(180))
            )
            .padding(.horizontal, 50)
            .padding()
            .animation(Animation.easeOut(duration: 0.3), value: isAuth)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background")
                            .resizable()
                            .frame(width: 1000, height: 1000)
                            .position(x: 450, y: 500)
                            .blur(radius: 4)
                            .ignoresSafeArea())
            .fullScreenCover(isPresented: $isTabViewShow) {
                MainTabBar()
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
