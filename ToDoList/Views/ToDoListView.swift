//
//  ToDoListView.swift
//  ToDoList
//
//  Created by 蔡宇炫 on 2024/2/1.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    //@FirestoreQuery var items: [ToDoListItem]

    init(userId: String) {
//        self._items = FirestoreQuery(
//            collectionPath: "users/\(userId)/todos"
//        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($viewModel.items) { $item in
                        ToDoListItemView(item: $item, onItemTap: {
                            viewModel.refreshTodos() // 在这里刷新
                        } )
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.deleteItem(id: item.id)
                                }
                                .tint(.red)
                            }
                            // move function?
                            //.onMove(perform: viewModel.moveItem(from: <#T##IndexSet#>, to: <#T##Int#>))
                    }
                }
                .listStyle(InsetListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Action
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView, onSave: {
                    viewModel.refreshTodos()   // 刷新數據
                })
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "jYAscvvBj6Urve6g3smX2830iPO2")
}
