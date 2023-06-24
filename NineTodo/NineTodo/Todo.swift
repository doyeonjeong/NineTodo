//
//  Todo.swift
//  NineTodo
//
//  Created by Doyeon on 2023/06/24.
//

import Foundation

@available(iOS 14.0, *)
struct ToDoItem: Identifiable, Codable, Hashable {
    let id = UUID()
    var title: String
    var description: String
    var isDone: Bool = false
}
