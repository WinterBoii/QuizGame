//
//  sectionOptionsView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-05.
//

import SwiftUI

struct sectionOptionsView: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false

    var body: some View {
        Section {
            categoryView()
            numberOfQuestionsView()
            difficultyView()
            Toggle("Dark mode", isOn: $isDark)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
        }
        .preferredColorScheme(isDark ? .dark : .light)
    }
}

struct sectionOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        sectionOptionsView()
    }
}
