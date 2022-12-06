//
//  TriviaView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-28.
//  https://youtu.be/b55npVkqa5U 

import SwiftUI

struct TriviaView: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false
    var body: some View {
        ZStack {
            if quizManager.reachedEnd {
                VStack(spacing: 55) {
                    scoreView()
                    NavigationLink {
                        GameSelectView()
                            .task {
                                quizManager.resetQuiz()
                            }
                    } label: {
                        PrimaryButton(text: "Play again")
                    }
                }
                .preferredColorScheme(isDark ? .dark : .light)
                .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(isDark ? Color("dark_mode") : quizManager.backgroundColor)
                .navigationBarBackButtonHidden(true)
            } else {
                QuestionView()
            }
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
