//
//  ContentView.swift
//  Quift
//
//  Created by Filmon Mehari Gebrezghi on 2022-11-19.
//  https://youtu.be/b55npVkqa5U 

import SwiftUI

struct ContentView: View {
    @StateObject var quizManager = QuizManager.shared
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Quiz Game")
                        .lilacTitle()
                    
                    Text("Are you ready to play?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink {
                    TriviaView()
                        .environmentObject(quizManager)
                } label: {
                    PrimaryButton(text: "Lets Go!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(quizManager.backgroundColor)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
