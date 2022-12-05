//
//  headerView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-05.
//

import SwiftUI

struct headerView: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Quiz Game")
                    .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                    .lilacTitle()
                Spacer()
                Text("\(quizManager.index + 1) out of \(quizManager.length)")
                    .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            Text("Category: " + (quizManager.selectedCategory ?? "General Knowledge"))
                .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
            
            ProgressBar(progress: quizManager.progress)
        }
        .preferredColorScheme(isDark ? .dark : .light)
    }
}

struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        headerView()
    }
}
