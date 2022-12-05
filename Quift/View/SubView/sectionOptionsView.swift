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
        }
    }
}

struct sectionOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        sectionOptionsView()
    }
}
