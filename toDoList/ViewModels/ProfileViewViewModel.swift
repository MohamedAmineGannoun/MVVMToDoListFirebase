//
//  ProfileViewViewModel.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel : ObservableObject {
    
    @Published var user : User? = nil
    
    init() {
        self.fetchUser()
    }
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { document, error in
            guard let data = document?.data(), error == nil else {
                return
            }
            
            self.user = User(id: data["id"] as? String ?? "",
                             name: data["name"] as? String ?? "",
                             email: data["email"] as? String ?? "",
                             joined: data["joined"] as? TimeInterval ?? 0)
            
        }
        
    }
    
    func logOutUser(){
        try? Auth.auth().signOut()
    }
    
}
