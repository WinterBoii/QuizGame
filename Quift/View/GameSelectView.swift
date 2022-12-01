//
//  GameSelectView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-29.
//  

import SwiftUI

struct GameSelectView: View {
    @StateObject var quizManager = QuizManager.shared
    
    var difficulties = ["😌", "🧐", "🤯"]
    var categories: [String:Int] = [
        "General Knowledge": 9,
        "Film": 11,
        "Video Games" : 15,
        "Science & Nature": 17,
        "Computers": 18,
        "Mathematics": 19,
        "Sports": 21,
        "Geography": 22,
        "Japanese Anime & Manga": 31,
        "Cartoon & Animations": 32
    ]
    @State var selectedDifficulty: String?
    @State var selectedCategory: String?
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            Text("Select Options")
                .font(.system(size: 50))
                .lilacTitle()
                .underline()
            Spacer()
            
            Text("Category:")
                .font(.largeTitle)
                .lilacTitle()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 55) {
                    ForEach(categories.sorted(by: >), id: \.key) { key, value in
                        Button {
                            if selectedCategory == key {
                                selectedCategory = nil
                            } else {
                                selectedCategory = key
                            }
                            print(key)
                        } label: {
                            Text("\(key)")
                        }
                        .padding()
                        .foregroundColor(selectedCategory == key ? Color.white : Color("AccentColor"))
                        .background(selectedCategory == key ? Color("AccentColor") : quizManager.backgroundColor)
                        .cornerRadius(25)
                    }
                    .font(.system(size: 25))
                    
                }
            }
            .frame(width: 330 ,height: 99)
            
            Spacer()
            
            Text("Difficulty:")
                .font(.largeTitle)
                .lilacTitle()
            
            HStack {
                ForEach(difficulties, id: \.self) { index in
                    Button("\(index)") {
                        if selectedDifficulty == index {
                            selectedDifficulty = nil
                        } else {
                            selectedDifficulty = index
                        }
                        print(index)
                    }
                    .font(.system(size: 50))
                    .padding()
                    .background(selectedDifficulty == index ? Color("AccentColor") : quizManager.backgroundColor)
                    .cornerRadius(33)
                    .padding(.bottom)
                }
            }
            
            NavigationLink {
                TriviaView()
            } label: {
                PrimaryButton(text: "Start Quiz")
                    .padding(.top)
                    .font(.system(size: 33))
                    .onSubmit {
                        //quizManager.getOptions(id: selectedCategory.value, level: selectedDifficulty, nrOfQuestions: "")
                    }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(quizManager.backgroundColor)
    }
}

struct GameSelectView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectView()
    }
}
