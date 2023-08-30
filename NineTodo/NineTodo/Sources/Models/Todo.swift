//
//  Todo.swift
//  NineTodo
//
//  Created by DOYEON JEONG on 2023/07/11.
//

import Foundation
import SwiftData

@Model
final class Todo {
    let title: String
    var isSuccess: Bool
    
    @Relationship(deleteRule: .cascade) var tasks: [Task] = []
    
    init() {
        self.title = Date().titleFormatter
        self.isSuccess = false
    }
}

