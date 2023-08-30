//
//  CreateTaskView.swift
//  NineTodo
//
//  Created by DOYEON JEONG on 2023/08/31.
//

import SwiftUI

struct CreateTaskView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Binding var section: SectionType
    @State var title: String = ""
    @State private var showingAlert = false
    var tasks: [Task]
    
    var body: some View {
        VStack(spacing: 18) {
            Text(section.rawValue)
                .foregroundColor(.black)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color(.systemIndigo).opacity(0.5))
                .cornerRadius(12)
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            
            TextField(title, text: $title)
                .padding(.leading)
                .foregroundColor(.black)
                .frame(minHeight: 80)
                .background(Color(.systemIndigo).opacity(0.4))
                .cornerRadius(12)
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            
            Button {
                if tasks.count < 3 {
                    createTask(title)
                } else {
                    showingAlert = true
                }
            } label: {
                Text("생성하기")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color(.systemIndigo).opacity(0.5))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("3개 이상 등록 불가능합니다."), message: Text("3가지 일에만 집중해볼까요?"), dismissButton: .default(Text("OK")))
            }
            Spacer()
        }
        .padding(.vertical)
        .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
    }
    
    func createTask(_ todo: String) {
        let newTask = Task(title: title, section: section, todo: todo)
        context.insert(newTask)
        dismiss()
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

//#Preview {
//    CreateTaskView(section: .constant(SectionType.afternoon), tasks: [
//        Task(title: "title", section: .afternoon, todo: "todo")
//    ])
//}
