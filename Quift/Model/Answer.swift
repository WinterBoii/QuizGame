//
//  Answer.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-28.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
