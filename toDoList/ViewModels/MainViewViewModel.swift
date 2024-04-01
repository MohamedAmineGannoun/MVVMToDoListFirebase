//
//  MainViewViewModel.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import Foundation
import FirebaseAuth

class MainViewViewModel : ObservableObject {
    
    @Published var currentUserId = ""
    
    init() {
        let handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn : Bool {
        Auth.auth().currentUser != nil
    }
    
}
