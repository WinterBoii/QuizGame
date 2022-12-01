//
//  TriviaView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-28.
//

import SwiftUI

struct TriviaView: View {
    @StateObject var quizManager = QuizManager.shared
    
    var body: some View {
        if quizManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Quiz Game")
                    .lilacTitle()
                
                Text("Congratulations, you completed the game!")
                
                Text("You scored \(quizManager.score) out of \(quizManager.length)")
                
                Button {
                    Task.init {
                        await quizManager.fetchQuiz()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(quizManager.backgroundColor)
            .navigationBarBackButtonHidden(true)
            
        } else {
            QuestionView()
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
