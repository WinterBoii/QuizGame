//
//  scoreView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-06.
//

import SwiftUI

struct scoreView: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false
    
    var body: some View {
        
        Text("Quiz Game")
            .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
            .lilacTitle()
        Text( (quizManager.score >= quizManager.length*70/100) ? "👍" : "👎")
            .font(.system(size: 100))
        if quizManager.score >= quizManager.length*70/100 {
            Text("Congratulations, you have done a great job!")
        } else{
            Text("Nice try, Better luck next time!")
        }
        ScoreShape()
    }
}

struct scoreView_Previews: PreviewProvider {
    static var previews: some View {
        scoreView()
    }
}
