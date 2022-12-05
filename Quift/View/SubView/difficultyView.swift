//
//  difficultyView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-02.
//

import SwiftUI

struct difficultyView: View {
    @StateObject var quizManager = QuizManager.shared
    @State var clickedDifficulty: String = ""
    
    var body: some View {
        
        HStack(spacing: 10) {
            Text("Difficulty:")
                .font(.title)
                .lilacTitle()
            
            Spacer()
            
            Picker("", selection: $clickedDifficulty) {
                ForEach(quizManager.getDifficulty().sorted(by: >), id: \.key) {
                    Text($0.key)
                        .frame(width: 50)
                }
            }
        }
        .onChange(of: clickedDifficulty) { _ in
            quizManager.selectedDifficulty = clickedDifficulty
        }
    }
}

struct difficultyView_Previews: PreviewProvider {
    static var previews: some View {
        difficultyView()
    }
}
