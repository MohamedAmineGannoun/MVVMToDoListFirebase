//
//  ToDoListItemViewViewModel.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel : ObservableObject {
    
    func toggleDone(item : ToDoListItem){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        db.collection("users").document(userId).collection("todos").document(item.id).setData(itemCopy.asDictionary())
        
    }
}
