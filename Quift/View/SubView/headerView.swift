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
    @State private var showingAlert = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 23) {
            HStack {
                Text("Quiz Game")
                    .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                    .lilacTitle()
                Spacer()
                Text("\(quizManager.index + 1) out of \(quizManager.length)")
                    .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            .toolbar {
                Button {
                    showingAlert.toggle()
                } label: {
                    Text("\(Image(systemName: "xmark"))")
                }
                .alert("Do you want to quit?", isPresented: $showingAlert) {
                    Button(role: .destructive) {
                        dismiss()
                    } label: {
                        Text("Yes")
                    }
                }
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
