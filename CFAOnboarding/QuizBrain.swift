//
//  QuizModel.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/19/23.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    let questions = [
        Question(question: "What does Chick-fil-A's 'Second Mile Service' mean?", options: ["Going above and beyond in serving customers", "Providing free food to customers", "Selling high-quality products", "Offering discounts to repeat customers"], answerIndex: 0),
        
        Question(question: "What is the name of Chick-fil-A's founder?", options: ["Dan Cathy", "Sam Walton", "Ray Kroc", "Truett Cathy"], answerIndex: 3),
        
        Question(question: "Which day of the week is Chick-fil-A closed?", options: ["Monday", "Tuesday", "Wednesday", "Sunday"], answerIndex: 3),
        
        Question(question: "What is the name of Chick-fil-A's famous sandwich?", options: ["Big Mac", "Whopper", "Original Chicken Sandwich", "Double Down"], answerIndex: 2)
    ]
    
    func getQuestionText() -> String {
        return questions[questionNumber].question
    }
}
