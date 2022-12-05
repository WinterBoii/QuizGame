//
//  numberOfQuestionsView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-02.
//

import SwiftUI

struct numberOfQuestionsView: View {
    @StateObject var quizManager = QuizManager.shared
    @State var clickedNmbr: Int = 5
    
    var body: some View {
        HStack(spacing: 10) {
            Text("Total questions (Max 50*)")
                .font(.title2)
                .lilacTitle()
            
            Spacer()
            
            Picker("Select", selection: $clickedNmbr) {
                ForEach(1..<51, id: \.self) {
                    Text("\($0)")
                }
            }
        }
        .onChange(of: clickedNmbr) { _ in
            quizManager.nrOfQuestionsFromUser = String(clickedNmbr)
        }
    }
}

struct numberOfQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        numberOfQuestionsView()
    }
}
