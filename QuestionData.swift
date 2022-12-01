//
//  QuestionData.swift
//  Quift
//
//  Created by Filmon Mehari Gebrezghi on 2022-11-19.
//

import Foundation

struct QuestionData: Decodable, Hashable{
    
    enum QuestionType: String, Decodable{
        case multiple, boolean
    }
    
    enum Difficulty: String, Decodable{
        case easy, medium, hard
    }
    
    let catagory: String
    let type: QuestionType
    let difficulty: Difficulty
    let question: String
    let corecctAnswer: String
    let incorrectAnswer: [String]
}
