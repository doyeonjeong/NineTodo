//
//  TodoManager.swift
//  NineTodo
//
//  Created by Doyeon on 2023/06/24.
//

import Foundation

import Foundation

class TodoManager: ObservableObject {
    private let fileURL: URL
    @Published var todos: [ToDoItem] = []
    
    init() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = documentDirectory.appendingPathComponent("todos.json")
        loadTodos()
    }
    
    func save(todos: [ToDoItem]) throws {
        let data = try JSONEncoder().encode(todos)
        try data.write(to: fileURL)
    }
    
    func loadTodos() {
        do {
            let data = try Data(contentsOf: fileURL)
            let loadedTodos = try JSONDecoder().decode([ToDoItem].self, from: data)
            self.todos = loadedTodos
        } catch {
            print("Failed to load todos: \(error)")
        }
    }
    
    func update(todo: ToDoItem) throws {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index] = todo
            try save(todos: todos)
        }
    }
    
    func delete(todo: ToDoItem) throws {
        todos.removeAll(where: { $0.id == todo.id })
        try save(todos: todos)
    }
    
    func add(todo: ToDoItem) throws {
        todos.append(todo)
        try save(todos: todos)
    }
}
