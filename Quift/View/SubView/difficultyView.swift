//
//  difficultyView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-02.
//

import SwiftUI

struct difficultyView: View {
    @StateObject var quizManager = QuizManager.shared
    @State var clickedDifficulty: String?
    
    var body: some View {
        Text("Difficulty:")
            .font(.title)
            .lilacTitle()
        
        HStack {
            ForEach(quizManager.getDifficulty().sorted(by: >), id: \.key) { key, value in
                Button("\(key)") {
                    if clickedDifficulty == key {
                        clickedDifficulty = nil
                        quizManager.selectedDifficulty = nil
                    } else {
                        clickedDifficulty = key
                        quizManager.selectedDifficulty = value
                    }
                    print(key)
                }
                .font(.system(size: 50))
                .padding(.horizontal)
                .background(quizManager.selectedDifficulty == value ? Color("AccentColor") : quizManager.backgroundColor)
                .cornerRadius(33)
                .padding(.bottom)
                .padding(.top)
            }
        }
    }
}

struct difficultyView_Previews: PreviewProvider {
    static var previews: some View {
        difficultyView()
    }
}
