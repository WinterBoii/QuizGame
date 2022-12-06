//
//  GameSelectView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-29.
//  

import SwiftUI

struct GameSelectView: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                Text("Select Options")
                    .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                    .lilacTitle()
                sectionOptionsView()
                    .frame(height: 110)
                    .padding(.horizontal)
                    .background(isDark ? Color("dark-card") : .white)
                    .cornerRadius(25)
                    .padding()
                
                NavigationLink {
                    TriviaView()
                        .task {
                            quizManager.setOptions(id: quizManager.getCodeByCategory(category: quizManager.selectedCategory ?? ""), level: quizManager.selectedDifficulty ?? "", nrOfQuestions: String(quizManager.nrOfQuestionsFromUser.isEmpty ? String(5) : quizManager.nrOfQuestionsFromUser))
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
        }
        .preferredColorScheme(isDark ? .dark : .light)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isDark ? Color("dark_mode") : quizManager.backgroundColor)
    }
}

struct GameSelectView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectView()
    }
}
