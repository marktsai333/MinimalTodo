//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by 蔡宇炫 on 2024/2/1.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
    
/// ViewModel for single to do list item view (eack row in items list)
class ToDoListItemViewViewModel: ObservableObject {    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)    // 翻轉checkbox
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionry() )


    }
    
    func showRefresh() {
        
    }
    
}
