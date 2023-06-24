//
//  Todo.swift
//  NineTodo
//
//  Created by Doyeon on 2023/06/24.
//

import Foundation

struct ToDoItem: Codable {
    let id = UUID()
    var title: String
    var description: String
    var isDone: Bool = false
}
