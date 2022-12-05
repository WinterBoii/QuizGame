//
//  ContentView.swift
//  Quift
//
//  Created by Filmon Mehari Gebrezghi on 2022-11-19.
//  https://youtu.be/b55npVkqa5U 

import SwiftUI

struct ContentView: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Quiz Game")
                        .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                        .lilacTitle()
                    
                    Text("Are you ready to play?")
                        .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                }
                
                NavigationLink {
                    GameSelectView()
                } label: {
                    PrimaryButton(text: "Lets Go!")
                }
            }
            .preferredColorScheme(isDark ? .dark : .light)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(isDark ? Color("dark_mode") : quizManager.backgroundColor)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
