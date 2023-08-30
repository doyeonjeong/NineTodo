//
//  SectionView.swift
//  NineTodo
//
//  Created by DOYEON JEONG on 2023/07/11.
//

import SwiftUI
import SwiftData

struct SectionView: View {
    
    @Environment(\.modelContext) var context
    var tasks: [Task]
    @State var section: SectionType
    @State private var showModal = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(section.rawValue)
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(Color(.systemIndigo))
                    .padding(.vertical)
                
                Spacer()
                
                Button {
                    showModal = !showModal
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color(.systemOrange))
                }
            }
            
            ForEach(tasks) { task in
                SectionCell(task: task)
            }
            .onDelete(perform: { indexSet in
                deleteTask(at: indexSet)
            })
        }
        
        .sheet(isPresented: $showModal) {
            CreateTaskView(section: $section, tasks: tasks)
        }
    }//: body
    
    private func deleteTask(at offsets : IndexSet){
        // TODO: Cell 밀어서 delete 구현
    }
    
}

//#Preview {
//    SectionView()
//}
