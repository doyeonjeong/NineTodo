//
//  SectionCell.swift
//  NineTodo
//
//  Created by DOYEON JEONG on 2023/07/11.
//

import SwiftUI

struct SectionCell: View {
    var task: Task

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(.systemIndigo))
            .frame(height: 60)
            .overlay(
                HStack {
                    Text(task.title)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding(.horizontal, 16)
            )
    }
}

//#Preview {
//    SectionCell()
//}
