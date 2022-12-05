//  QuestionView.swift
//  Quift
//  Created by Muhammad Amiin Obidhonyi on 2022-11-28.
//  https://youtu.be/b55npVkqa5U 

import SwiftUI

struct QuestionView: View {
    @StateObject var quizManager = QuizManager.shared
    @State var show = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                headerView()
                
                VStack(alignment: .leading, spacing: 30) {
                    Text(quizManager.question)
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.black)
                    
                    ForEach(quizManager.answerChoices, id: \.id) { answer in
                        AnswerRow(answer: answer)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                
                Button {
                    quizManager.goToNextQuestion()
                } label: {
                    PrimaryButton(text: "Next", background: quizManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                }
                .disabled(!quizManager.answerSelected)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(quizManager.backgroundColor)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
