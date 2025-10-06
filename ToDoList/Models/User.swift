//
//  User.swift
//  ToDoList
//
//  Created by 蔡宇炫 on 2024/2/1.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
