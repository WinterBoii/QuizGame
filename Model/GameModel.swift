//
//  GameModel.swift
//  Quift
//
//  Created by Filmon Mehari Gebrezghi on 2022-11-21.
//

import Foundation
import Combine //framework we using here
struct OpenTrivaDBResult: Decodable{
    let results: [QuestionData]
}

class GameModel: ObservableObject{
    private let urlString = "https://opentdb.com/api.php?amount=6&category=18&type=multiple"
    private var cancellable: Cancellable?
    private let jsonDecoder = JSONDecoder()
    
    @Published var questions: [QuestionData] = []
    
    init(){
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func loadQuestions(){
        guard let url = URL(string: urlString) else {
            return
        }
        cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap{ element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                        httpResponse.statusCode < 400 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: OpenTrivaDBResult.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            },receiveValue:{ [weak self] data in
                self?.questions = data.results
            })
    }
}
