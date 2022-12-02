//
//  numberOfQuestionsView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-02.
//

import SwiftUI

struct numberOfQuestionsView: View {
    @StateObject var quizManager = QuizManager.shared
    
    var body: some View {
        Text("Total questions (Max 50*)")
            .lilacTitle()
            .multilineTextAlignment(.center)
            .padding(.bottom)
        
        TextField("Number:", text: $quizManager.nrOfQuestionsFromUser)
            .multilineTextAlignment(.center)
            .background()
            .frame(width: 220)
            .cornerRadius(15)
            .foregroundColor(Color("AccentColor"))
            .padding(.bottom)
    }
}

struct numberOfQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        numberOfQuestionsView()
    }
}
