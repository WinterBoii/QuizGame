//
//  GameSelectView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-29.
//  

import SwiftUI

struct GameSelectView: View {
    @StateObject var quizManager = QuizManager.shared
    var body: some View {
        VStack {
            Text("Select Options")
                .lilacTitle()
                .underline()
            sectionOptionsView()
                .frame(height: 110)
                .padding(.horizontal)
                .background()
                .cornerRadius(25)
                .padding()
            
            NavigationLink {
                TriviaView()
                    .task {
                        quizManager.getOptions(id: quizManager.getCodeByCategory(category: quizManager.selectedCategory ?? ""), level: quizManager.selectedDifficulty ?? "", nrOfQuestions: String(quizManager.nrOfQuestionsFromUser.isEmpty ? String(5) : quizManager.nrOfQuestionsFromUser))
                        await quizManager.fetchQuiz()
                    }
            } label: {
                PrimaryButton(text: "Start Quiz")
                    .padding(.top)
                    .onSubmit {
                    }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(quizManager.backgroundColor)
        
    }
}

struct GameSelectView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectView()
    }
}
