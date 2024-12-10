//
//  Todo.swift
//  TodoApp
//
//  Created by 허재영 on 2024.12.09.
//

import Foundation

@Observable
class Todo: Identifiable {
    var id: UUID
    var title: String
    var isCompleted: Bool
    var description: String
    
    init(title: String, isCompleted: Bool = false, description: String = "") {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
        self.description = description
    }
}