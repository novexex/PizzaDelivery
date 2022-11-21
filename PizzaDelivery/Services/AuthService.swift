//
//  AuthService.swift
//  PizzaDelivery
//
//  Created by Артур Ильясов on 21.11.2022.
//

import Foundation
import FirebaseAuth
import Firebase

class AuthService {
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    private var currentUser: User? {
        return auth.currentUser
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    private init() {}
}
