//
//  difficultyView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-02.
//

import SwiftUI

struct difficultyView: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false
    @State var clickedDifficulty: String = ""
    
    var body: some View {
        
        ZStack(alignment: .leading) {
                Text("Difficulty:")
                    .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                    .font(.title2)
                    .lilacTitle()
                
                Spacer()
                
                Menu {
                    Picker("", selection: $clickedDifficulty) {

                        ForEach(quizManager.getDifficulty().sorted(by: <), id: \.value) {
                            Text($0.key)
                                .frame(width: 50)
                        }
                    }
                } label: {
                    Spacer()
                        .frame(width: 200)
                    Text(clickedDifficulty.capitalized)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Image(systemName: "arrow.up.arrow.down")
                }
                .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
            }
            .preferredColorScheme(isDark ? .dark : .light)
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
