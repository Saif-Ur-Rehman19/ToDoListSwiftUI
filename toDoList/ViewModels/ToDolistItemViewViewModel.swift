//
//  ToDolistItemViewViewModel.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// ViewModel for single to do list item view(each row in items list)

class ToDolistItemViewViewModel: ObservableObject {
    
    init() {
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.asDictionary())
    }
}
