//
//  TodoManager.swift
//  NineTodo
//
//  Created by Doyeon on 2023/06/24.
//

import Foundation

class TodoManager {
    private let fileURL: URL
    
    init() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = documentDirectory.appendingPathComponent("todos.json")
    }
    
    func save(todos: [ToDoItem]) throws {
        let data = try JSONEncoder().encode(todos)
        try data.write(to: fileURL)
    }
    
    func load() throws -> [ToDoItem] {
        let data = try Data(contentsOf: fileURL)
        let todos = try JSONDecoder().decode([ToDoItem].self, from: data)
        return todos
    }
    
    func update(todo: ToDoItem) throws {
        var todos = try load()
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index] = todo
            try save(todos: todos)
        }
    }

    func delete(todo: ToDoItem) throws {
        var todos = try load()
        todos.removeAll(where: { $0.id == todo.id })
        try save(todos: todos)
    }
}
