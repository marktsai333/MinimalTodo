//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by 蔡宇炫 on 2024/2/1.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    @Binding var item:  ToDoListItem
    var onItemTap: (() -> Void)? // 定义回调闭包
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
                onItemTap?() // 点击时调用
                // 回傳
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

//#Preview {
//    ToDoListItemView(item: .init(id: "123",
//                                 title: "Get milk",
//                                 dueDate: Date().timeIntervalSince1970,
//                                 createdDate: Date().timeIntervalSince1970,
//                                 isDone: true))
//    
//
//}

struct ToDoListItemView_PreviewWrapper: View {
    @State private var item = ToDoListItem(id: "123",
                                           title: "Get milk",
                                           dueDate: Date().timeIntervalSince1970,
                                           createdDate: Date().timeIntervalSince1970,
                                           isDone: true)

    var body: some View {
        ToDoListItemView(item: $item)
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView_PreviewWrapper()
    }
    
}
