//
//  categoryView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-02.
//

import SwiftUI

struct categoryView: View {
    @StateObject var quizManager = QuizManager.shared
    @State var clickedCategory: String?
    var body: some View {
        Text("Category:")
            .font(.title)
            .lilacTitle()
        ScrollView(.horizontal) {
            LazyHStack(spacing: 55) {
                ForEach(quizManager.getCategories().sorted(by: >), id: \.key) { key, value in
                    Button {
                        if clickedCategory == key {
                            clickedCategory = nil
                            quizManager.selectedCategory = nil
                        } else {
                            clickedCategory = key
                            quizManager.selectedCategory = String(value)
                        }
                        print(key)
                    } label: {
                        Text("\(key)")
                    }
                    .padding()
                    .foregroundColor(clickedCategory == key ? Color.white : Color("AccentColor"))
                    .background(clickedCategory == key ? Color("AccentColor") : quizManager.backgroundColor)
                    .cornerRadius(25)
                }
                .font(.system(size: 25))
            }
        }
        .frame(width: 330 ,height: 99)
    }
}

struct categoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        categoryView()
    }
}
