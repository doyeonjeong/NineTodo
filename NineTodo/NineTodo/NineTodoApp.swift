//
//  NineTodoApp.swift
//  NineTodo
//
//  Created by Doyeon on 2023/06/24.
//

import SwiftUI

@main
struct NineTodoApp: App {
    @StateObject var todoManager = TodoManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(todoManager)
        }
    }
}
