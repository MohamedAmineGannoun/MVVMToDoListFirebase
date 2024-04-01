//
//  ToDoListViewViewModel.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListViewViewModel : ObservableObject {
    
    @Published var showingNewItemView = false
    private let userId : String
    
    init(userId : String){
        self.userId = userId
    }
    
    func delete(itemId : String) {
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(itemId).delete()
        
    }
    
}
