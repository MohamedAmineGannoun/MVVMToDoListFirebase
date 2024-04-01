//
//  RegisterViewViewModel.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func register(){
        
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserId(userId: userId)
            
        }
        
    }
    
    private func insertUserId(userId: String){
        let newUser = User(id: userId, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        Firestore.firestore().collection("users").document(userId).setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool{
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "please enter a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "password must be of 6 digits and plus"
            return false
        }
        
        return true
    }
    
}
