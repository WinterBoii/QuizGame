//
//  GameSelectView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-29.
//

import SwiftUI

struct GameSelectView: View {
    @StateObject var quizManager = QuizManager.shared
    
    var difficulty = ["😌", "🧐", "🤯"]
    @State var selectedDifficulty = ""
    
    var body: some View {
        VStack {
            Text("Select")
                .lilacTitle()
            
            HStack {
                ForEach(difficulty, id: \.self) { index in
                    Button {
                        print(index)
                        selectedDifficulty = index
                    } label: {
                        Text(index)
                            .font(.largeTitle)
                    }
                }
            }
            
            
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
