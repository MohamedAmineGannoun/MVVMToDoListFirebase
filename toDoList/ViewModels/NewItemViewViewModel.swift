//
//  NewItemViewViewModel.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    func save(){
        
        // get user id
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(currentUserId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
 
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date() else {
            return false
        }
        
        return true
        
    }
}
