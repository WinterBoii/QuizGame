//
//  QuizManager.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-28.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    private(set) var trivia: [QuizData.Result] = []
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
    
    private init() {
        //task because our func is async
        Task.init {
            await fetchQuiz()
        }
    }

    public static var shared = QuizManager()
    
    func fetchQuiz() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("Missing url") }
        
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
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                self.timer = 0.0
                
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching trivia: \(error)")
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
        
        print(progress)
        
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
}
