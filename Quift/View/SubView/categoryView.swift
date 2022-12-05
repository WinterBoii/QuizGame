//
//  categoryView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-02.
//

import SwiftUI

struct categoryView: View {
    @StateObject var quizManager = QuizManager.shared
    @AppStorage("darkmode") var isDark: Bool = false
    @State var clickedCategory: String = ""
    
    var body: some View {
        HStack(spacing: 10) {
            Text("Category:")
                .font(.title2)
                .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                .lilacTitle()
            
            Spacer()
            
            Menu {
                Picker("", selection: $clickedCategory) {
                    ForEach(quizManager.getCategories().sorted(by: <), id: \.key) {
                        Text($0.key)
                    }
                }
            } label: {
                Text(clickedCategory)
                Image(systemName: "arrow.up.arrow.down")
            }
            .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
            
        }
        .preferredColorScheme(isDark ? .dark : .light)
        .onChange(of: clickedCategory) { _ in
            quizManager.selectedCategory = clickedCategory
        }
    }
}

struct categoryView_Previews: PreviewProvider {
    static var previews: some View {
        categoryView()
    }
}
