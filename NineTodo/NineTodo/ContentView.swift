//
//  ContentView.swift
//  NineTodo
//
//  Created by Doyeon on 2023/06/24.
//

import SwiftUI

struct ToDoItem {
    let id: UUID
    var title: String
    var description: String
    var isDone: Bool
}

struct ContentView: View {
    
    @State private var toDoItems: [ToDoItem] = [
        ToDoItem(id: UUID(), title: "Do laundry", description: "Don't forget the fabric softener!", isDone: false),
        ToDoItem(id: UUID(), title: "Buy groceries", description: "Milk, eggs, bread", isDone: false),
        ToDoItem(id: UUID(), title: "Workout", description: "30 minutes of cardio", isDone: false)
    ]
    
    @State private var isPresentingNewTodoView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                List {
                    ForEach(toDoItems.indices, id: \.self) { index in
                        TodoListCell(isChecked: $toDoItems[index].isDone, title: toDoItems[index].title, description: toDoItems[index].description)
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
                
                NavigationLink(destination: NewTodoView(), isActive: $isPresentingNewTodoView) {
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
            Button {
                isChecked.toggle()
            } label: {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            }
            VStack {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                Text(description)
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
            }
        }
    }
}

struct NewTodoView: View {
    @State private var title = ""
    @State private var description = ""
    
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
                // Add your save action here
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
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
