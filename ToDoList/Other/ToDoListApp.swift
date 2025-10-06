//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 蔡宇炫 on 2024/2/1.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
       
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

