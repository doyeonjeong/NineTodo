//
//  ContentView.swift
//  NineTodo
//
//  Created by DOYEON JEONG on 2023/07/11.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]

    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)

            VStack {
                // MARK: - Header
                
                
                HStack {
                    Text("NineTodo")
                        .font(.system(size: 30, weight: .bold))

                    Spacer()

                    Button {
                        // TODO: 튜토리얼
                    } label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding()
                
                Text(Date().titleFormatter)
                    .font(.system(size: 18, weight: .light))

                // MARK: - Body
                ScrollView {
                    ForEach(SectionType.allCases, id: \.self) { section in
                        SectionView(tasks: tasks.filter { $0.section == section }, section: section)
                            .padding(.horizontal)
                    }
                }
            }
            .onAppear {
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)
            }
        }//: ZStack
    }//: body
}
