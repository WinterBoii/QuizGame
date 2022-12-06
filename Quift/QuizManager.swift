//
//  QuizManager.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-28.
//  https://youtu.be/b55npVkqa5U

import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    @Published var trivia: [QuizData.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0
    @Published private(set) var score = 0
    @Published private(set) var timer = 0.0
    @Published public var backgroundColor: Color = Color("fire")
    @Published var correctAnswer:String = ""
    
    @Published var selectedCategory: String?
    @Published var selectedDifficulty: String?
    @Published var nrOfQuestionsFromUser: String = ""
    @Published var options: [String:String] = [:]
    
    private init() {
    }

    public static var shared = QuizManager()
    
    func fetchQuiz() async {
        guard let url = URL(string: createURL(querys: options)) else { fatalError("Missing url") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error at status code") }
            
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(QuizData.self, from: data)
            
            //we need to deploy it to the main thread
            DispatchQueue.main.async {
                //everytime we fetch data we reset our variables, to referesh
                self.resetQuiz()
                
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
                //print("hey")
            }
        } catch {
            print("Error fetching trivia: \(error)")
        }
    }
    
    func resetQuiz() {
        self.selectedDifficulty = nil
        self.selectedCategory = nil
        self.nrOfQuestionsFromUser = ""
        
        self.index = 0
        self.score = 0
        self.progress = 0.00
        self.reachedEnd = false
        self.timer = 0.0
    }
    
    func createURL(querys:[String:String]) -> String{
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "opentdb.com"
        components.path = "/api.php"
        
        components.queryItems = querys.map{
            URLQueryItem(name: $0.key, value: $0.value)
        }
        //print(components.string!)
        return components.string!
    }
    
    func setOptions(id: String, level: String, nrOfQuestions: String) {
        if !id.isEmpty {
            options["category"] = String(id)
        }
        if !level.isEmpty {
            options["difficulty"] = level
        }
        if !nrOfQuestions.isEmpty {
            options["amount"] = nrOfQuestions
        } else {
            options["amount"] = String(5)
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        //refresh selected
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        //print(progress)
        if index < length {
            let currentQuestion = trivia[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
    func validateQuestionNrInput(nr: Int) -> String {
        if nr < 1 {
                return String(1)
            }
        if nr > 50 {
                return String(50)
            }
        return String(nr)
    }
    
    func getCodeByCategory(category: String) -> String {
        return String(getCategories()[category] ?? 9)
    }
    
    func getCategories() -> [String:Int]{
        return [
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
    }
    
    func getDifficulty() -> [String:String] {
        return [
            "😌" : "easy",
            "🧐" : "medium",
            "🤯" : "hard"
        ]
    }
}
