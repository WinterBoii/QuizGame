//
//  QuitGameView.swift
//  Quift
//
//  Created by Filmon Mehari Gebrezghi on 2022-12-02.
//

import SwiftUI

struct QuitGameView: View {
    @StateObject var quizManager = QuizManager.shared
    @Environment(\.dismiss) private var dismiss
    @State private var showDismissWarning = false
    
    var body: some View {
        NavigationStack{
            HStack{
                Text("quit")
            }

            .toolbar{
                Button{
                    showDismissWarning.toggle()
                } label: {
                    Label("Quit", systemImage: "xmark")
                        .foregroundColor(Color("AccentColor"))
                }
                .alert("Dou you want to quit?", isPresented: $showDismissWarning){
                    Button(role: .destructive){
                        dismiss()
                    }label: {
                        Text("Yes")
                    }
                }
            }


        }.background(quizManager.backgroundColor)
        
        
    }
}
    struct QuitGameView_Previews: PreviewProvider {
        static var previews: some View {
            QuitGameView()
        }
    }
