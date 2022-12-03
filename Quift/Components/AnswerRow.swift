//
//  AnswerRow.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-28.
//  https://youtu.be/b55npVkqa5U 

import SwiftUI

struct AnswerRow: View {
    @StateObject var quizManager = QuizManager.shared
    @State private var isSelected = false
    var answer: Answer
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
            
            if !isSelected && quizManager.answerSelected && answer.isCorrect
            {
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(quizManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red) : !isSelected && quizManager.answerSelected && answer.isCorrect ? .blue : .gray, radius: 15, x: 0.5, y: 0.5)
        .onTapGesture {
            if !quizManager.answerSelected {
                isSelected = true
                quizManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Simple", isCorrect: false))
    }
}
