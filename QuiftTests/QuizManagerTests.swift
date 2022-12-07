//
//  QuizManagerTests.swift
//  QuiftTests
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-06.
//

import XCTest
@testable import Quift
import SwiftUI

@MainActor
final class QuizManagerTests: XCTestCase {
    
    func testResetQuiz() {
        let manager = QuizManager.shared
        manager.resetQuiz()
        
        XCTAssertNil(manager.selectedCategory)
        XCTAssertNil(manager.selectedDifficulty)
        XCTAssert(manager.nrOfQuestionsFromUser.isEmpty)
        print("Test succeded")
    }
    //Test 2 Green
    func testCreateURL() {
        let manager = QuizManager.shared
        
        manager.setOptions(id: "", level: "", nrOfQuestions: "")
        let url1 = manager.createURL(querys: manager.options)
        XCTAssertEqual(url1, "https://opentdb.com/api.php?amount=5")
        
        //with all 3 inparameters:
        manager.setOptions(id: "11", level: "hard", nrOfQuestions: "3")
        let url2 = manager.createURL(querys: manager.options)
        //our
        XCTAssert(
            url2 == "https://opentdb.com/api.php?amount=3&category=11&difficulty=hard" ||
            url2 == "https://opentdb.com/api.php?amount=3&difficulty=hard&category=11" ||
            url2 == "https://opentdb.com/api.php?difficulty=hard&category=11&amount=3" ||
            url2 == "https://opentdb.com/api.php?difficulty=hard&amount=3&category=11" ||
            url2 == "https://opentdb.com/api.php?category=11&amount=3&difficulty=hard" ||
            url2 == "https://opentdb.com/api.php?category=11&difficulty=hard&amount=3"
        )
    }
    
    func testgoToNextQuestion() async {
        let manager = QuizManager.shared
        manager.setOptions(id: "", level: "", nrOfQuestions: "")
        await manager.fetchQuiz()
        
        manager.goToNextQuestion()
        manager.goToNextQuestion()
        manager.goToNextQuestion()
        
        XCTAssertEqual(manager.index, 3)
    }
    
    func testValidateQuestionNrInput() {
        let manager = QuizManager.shared
        let result: String = manager.validateQuestionNrInput(nr: 51)
        XCTAssert(result == String(50))
        
        let result1: String = manager.validateQuestionNrInput(nr: 555)
        XCTAssert(result1 == String(50))
        
        let result2: String = manager.validateQuestionNrInput(nr: 0)
        XCTAssert(result2 == String(1))
        
        let result3: String = manager.validateQuestionNrInput(nr: -10)
        XCTAssert(result3 == String(1))
    }
}
