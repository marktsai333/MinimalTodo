//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by 蔡宇炫 on 2024/2/1.
//

import FirebaseFirestore
import Foundation

/// ViewModel for lsit of item view
/// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    @Published var items: [ToDoListItem] = []
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        fetchItems()
    }
    
    /// Delete to do list item
    /// - Parameter id: Item id to delete
//    func deleteItem(id: String) {
//        let db = Firestore.firestore()
//        
//        db.collection("users")
//            .document(userId)
//            .collection("todos")
//            .document(id)
//            .delete()
//    }
    
    /// New delete func
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete { error in
                if let error = error {
                    print("Error removing document: \(error)")
                } else {
                    // Also remove the item from the local array to update the UI
                    DispatchQueue.main.async {
                        self.items.removeAll { $0.id == id }
                    }
                }
            }
    }

    
    /// Fetch to-do items and order them by dueDate
    func fetchItems() {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .order(by: "dueDate") // Order the results by dueDate
            .getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.items = querySnapshot!.documents.compactMap { documentSnapshot in
                        try? documentSnapshot.data(as: ToDoListItem.self)
                    }
                }
            }
    }
    
    /// 添加新待办事项后用于刷新数据的方法
    func refreshTodos() {
            fetchItems()
        }

    
    // Method to handle reordering of the to-do list items
    //    func moveItem(from source: IndexSet, to destination: Int) {
    //        items.move(fromOffsets: source, toOffset: destination)
    //        // Add here any additional logic needed to persist the new order
    //    }
    
    
}
