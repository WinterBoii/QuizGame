//
//  categoryView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-02.
//

import SwiftUI

struct categoryView: View {
    @StateObject var quizManager = QuizManager.shared
    @State var clickedCategory: String = "Computers"
    
    var body: some View {
        HStack(spacing: 10) {
            Text("Category:")
                .font(.title2)
                .lilacTitle()
            
            Spacer()
            
            Picker("Select", selection: $clickedCategory) {
                ForEach(quizManager.getCategories().sorted(by: >), id: \.key) {
                    Text($0.key)
                }
            }
        }
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
