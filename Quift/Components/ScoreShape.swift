//
//  ScoreShape.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-06.
//

import SwiftUI

struct ScoreShape: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false
    
    var body: some View {
        HStack(spacing: 10) {
            Text("\(quizManager.score)")
                .btnShape()
                .background(isDark ? Color("dark-card") : Color("AccentColor"))
                .cornerRadius(15)
            Text("/")
                .font(.title)
            Text("\(quizManager.length)")
                .btnShape()
                .background(isDark ? Color("dark-card") : Color("AccentColor"))
                .cornerRadius(15)
        }
        .foregroundColor(isDark ? Color(.white) : Color("AccentColor"))
    }
}

struct ScoreShape_Previews: PreviewProvider {
    static var previews: some View {
        ScoreShape()
    }
}
