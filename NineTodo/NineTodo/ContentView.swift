//  ContentView.swift
//  NineTodo
//
//  Created by Doyeon on 2023/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var todoManager: TodoManager
    @State private var isPresentingNewTodoView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                List {
                    ForEach(todoManager.todos.indices, id: \.self) { index in
                        TodoListCell(isChecked: $todoManager.todos[index].isDone, title: todoManager.todos[index].title, description: todoManager.todos[index].description)
                    }
                    
                }
            }
        }
    }
    
    var headerView: some View {
        ZStack {
            HStack {
                Text("Nine Todo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink(destination: NewTodoView().environmentObject(todoManager), isActive: $isPresentingNewTodoView) {
                    Button(action: {
                        isPresentingNewTodoView = true
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
        }
    }
}

struct TodoListCell: View {
    @Binding var isChecked: Bool
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Button(action: {
                isChecked.toggle()
            }) {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading, 20)
                
                Text(description)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.leading, 20)
            }
        }
    }
}

struct NewTodoView: View {
    @EnvironmentObject var todoManager: TodoManager
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        VStack {
            Text("New Todo")
                .font(.system(size: 26, weight: .bold))
                .padding(.bottom, 20)
            
            TextField("Title", text: $title)
                .font(.system(size: 20, weight: .regular))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            TextField("Description", text: $description)
                .font(.system(size: 20, weight: .regular))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 20)
            
            Button(action: {
                addTodo()
            }) {
                Text("저장하기")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func addTodo() {
        let newTodo = ToDoItem(title: title, description: description, isDone: false)
        do {
            try todoManager.add(todo: newTodo)
        } catch {
            print("Failed to add todo: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoManager())
    }
}
