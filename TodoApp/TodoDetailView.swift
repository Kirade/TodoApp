//
//  TodoDetailView.swift
//  TodoApp
//
//  Created by 허재영 on 2024.12.10.
//

import SwiftUI

struct TodoDetailView: View {
    @State var todo: Todo
    
    var body: some View {
        VStack {
            TextField("투두 타이틀", text: $todo.title)
                .font(.title2)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 2)
                }
            TextEditor(text: $todo.detail)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 2)
                }
        }
        .padding()
        .navigationTitle("Edit Task 📋")
    }
}

#Preview {
    TodoDetailView(todo: Todo(title: "상세 화면 TODO"))
}
