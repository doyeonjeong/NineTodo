//
//  Task.swift
//  NineTodo
//
//  Created by DOYEON JEONG on 2023/07/11.
//

import Foundation
import SwiftData

@Model
final class Task {
    var title: String
    var section: SectionType
    var isDone: Bool
    
    @Relationship(deleteRule: .cascade, inverse: \Todo.title) var todo: String
    
    init(title: String, section: SectionType, todo: String) {
        self.title = title
        self.section = section
        self.isDone = false
        self.todo = todo
    }
}

enum SectionType: String, Codable, CaseIterable {
    case morning = "Morning"
    case afternoon = "Afternoon"
    case evening = "Evening"
}
