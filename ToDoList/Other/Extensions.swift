//
//  Extensions.swift
//  ToDoList
//
//  Created by 蔡宇炫 on 2024/2/2.
//

import Foundation

extension Encodable {
    func asDictionry() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
 
