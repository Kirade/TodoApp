//
//  ContentView.swift
//  TodoApp
//
//  Created by 허재영 on 2024.12.09.
//

import SwiftUI

struct ContentView: View {
    @State var todoList: [Todo] = [
        Todo(title: "친구 만나기"),
        Todo(title: "과제 제출하기"),
        Todo(title: "푹 쉬기")
    ]
    
    func addTodo() {
        withAnimation {
            let newTodo = Todo(title: "새로운 투두")
            todoList.append(newTodo)
        }
    }
    
    func deleteTodo(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
                todoList.remove(at: index)
            }
        }
        
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todoList) { todo in
                    HStack {
                        Image(systemName: todo.isCompleted ? "circle.fill" : "circle")
                            .foregroundColor(.pink)
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        NavigationLink {
                            TodoDetailView(todo: todo)
                        } label: {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: .gray)
                                .foregroundStyle(todo.isCompleted ? .gray : .primary)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteTodo)
            }
            .listStyle(.plain)
            .navigationTitle("Todo 🏓")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTodo, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
