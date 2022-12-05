//
//  headerView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-05.
//

import SwiftUI

struct headerView: View {
    @StateObject var quizManager = QuizManager.shared
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Quiz Game")
                    .lilacTitle()
                Spacer()
                Text("\(quizManager.index + 1) out of \(quizManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            Text("Category: " + (quizManager.selectedCategory ?? "General Knowledge"))
                .foregroundColor(Color("AccentColor"))
            
            ProgressBar(progress: quizManager.progress)
        }
    }
}

struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        headerView()
    }
}
