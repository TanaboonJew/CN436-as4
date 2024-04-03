//
//  LoginViewModel.swift
//  note
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/3/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password)
    }
}
