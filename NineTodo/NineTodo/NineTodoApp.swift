//
//  NineTodoApp.swift
//  NineTodo
//
//  Created by DOYEON JEONG on 2023/07/11.
//

import SwiftUI
import SwiftData

@main
struct NineTodoApp: App {

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .modelContainer(for: [Todo.self, Task.self])
        }
    }
}
