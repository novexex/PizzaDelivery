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
    @State private var isSignIn = true
    @State private var isShowAlert = false
    @State private var isTabViewShow = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                TextField("email", text: $email)
                    .padding()
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
                SecureField("password", text: $password)
                    .padding()
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
                if !isSignIn {
                    SecureField("confirm password", text: $confirmPassword)
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                }
                
                
                // MARK: Sign In button
                Button {
                    print(isSignIn ? "Sign In pressed" : "Sign Up pressed from Sign In button")
                    // MARK: mutating to Sing Up button
                    if !isSignIn {
                        guard password == confirmPassword else {
                            alertMessage = "The passwords do not match"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.signUp(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                            case .success(_):
                                    alertMessage = "Registration is successful!"
                                    print("alert reg is success")
                                    isShowAlert.toggle()
                                case .failure(let error):
                                    alertMessage = "Registration error: \(error.localizedDescription)"
                                    isShowAlert.toggle()
                            }
                        }
                    }
                } label: {
                    Text(isSignIn ? "Sign In" : "Sign Up")
                        .font(.system(size: 15, weight: .bold))
                        .frame(maxWidth: .maximum(125, 125))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("buttonColor"))
                        .cornerRadius(16)
                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                }.padding(.top, 15)
                    .alert(alertMessage, isPresented: $isShowAlert) {
                        Button("OK", role: .cancel) {
                            isShowAlert.toggle()
                            isTabViewShow.toggle()
                            isSignIn.toggle()
                        }
                    }
                    .fullScreenCover(isPresented: $isTabViewShow) {
                        MainTabBarView()
                    }
                
                // MARK: Sign Up button
                Button {
                    print(isSignIn ? "Sign Up pressed" : "Sign In pressed from Sign In button")
                    isSignIn.toggle()
                } label: {
                    Text(isSignIn ? "Sign Up" : "Return to Sign In")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .shadow(color: Color("buttonColor"), radius: 3, x: 0, y: 0)
                }
                

    
            }.background(Image("pepperoniBg")
                            .resizable()
                            .frame(width: isSignIn ? 375 : 380, height: isSignIn ? 375 : 380)
                            .opacity(0.85)
                            .offset(y: isSignIn ? -15 : 17)
                            .rotationEffect(isSignIn ? .degrees(0) : .degrees(180))
            )
            .padding(.horizontal, 50)
            .padding()
            .animation(Animation.easeOut(duration: 0.3), value: isSignIn)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background")
                            .resizable()
                            .frame(width: 1000, height: 1000)
                            .position(x: 450, y: 500)
                            .blur(radius: 4)
                            .ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
