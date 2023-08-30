//
//  Date+Extension.swift
//  NineTodo
//
//  Created by DOYEON JEONG on 2023/07/11.
//

import Foundation

extension Date {
    var titleFormatter: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: self)
    }
}
