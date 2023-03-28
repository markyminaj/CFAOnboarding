//
//  QuizModel.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/19/23.
//

import UIKit

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    var progress: Float = 0
    var questionIndex = 0
    
    let quizData = [
        QuizCategory(title: "Trivia", description: "Questions based on Chick-fil-A History and facts about the company", completionPercent: 0, completed: false, questions: [
            Question(title: "What does Chick-fil-A's 'Second Mile Service' mean?", options: ["Going above and beyond in serving customers", "Providing free food to customers", "Selling high-quality products", "Offering discounts to repeat customers"], answerIndex: 0),
            Question(title: "What is the name of Chick-fil-A's founder?", options: ["Dan Cathy", "Sam Walton", "Ray Kroc", "Truett Cathy"], answerIndex: 3),
            Question(title: "Which day of the week is Chick-fil-A closed?", options: ["Monday", "Tuesday", "Wednesday", "Sunday"], answerIndex: 3),
            Question(title: "What is the name of Chick-fil-A's famous sandwich?", options: ["Big Mac", "Whopper", "Original Chicken Sandwich", "Double Down"], answerIndex: 2),
            Question(title: "How many Chick-fil-A dipping sauces do we have?", options: ["8", "5", "10", "7"], answerIndex: 3),
        ]),
        QuizCategory(title: "Food Safety", description: "Questions based on general food safety and Chick-fil-A standards", completionPercent: 0, completed: false, questions: [
            Question(title: "How many seconds should you wash your hands at a minimum?", options: ["20", "10", "60", "45"], answerIndex: 0),
            Question(title: "What is the temperature range that food should be stored at to prevent the growth of bacteria?", options: ["0-32°F", "33-41°F", "42-50°F", "51-60°F"], answerIndex: 1),
            Question(title: "Which of the following is NOT a common foodborne illness?", options: ["Norovirus", "Salmonella", "E. coli", "Lyme disease"], answerIndex: 3),
            Question(title: "What is the maximum amount of time that cooked food can be left out at room temperature before it should be thrown away?", options: ["1 hour", "2 hours", "3 hours", "4 hours"], answerIndex: 1),
            Question(title: "What is the name of the process used to kill bacteria and other harmful microorganisms in food?", options: ["Pasteurization", "Filtration", "Distillation", "Irradiation"], answerIndex: 0),
            Question(title: "Which of the following is a sign of good food quality?", options: ["Dry, tough texture", "Foul odor", "Discoloration", "Fresh appearance"], answerIndex: 3),
            Question(title: "What is the name of the program Chick-fil-A uses to ensure the quality and safety of its food?", options: ["Good Manufacturing Practices", "Hazard Analysis and Critical Control Points", "Safe Quality Food", "Food Safety Modernization Act"], answerIndex: 2),
            Question(title: "What is the temperature that chicken should be cooked to in order to ensure it is safe to eat?", options: ["145°F", "160°F", "175°F", "190°F"], answerIndex: 1),
            Question(title: "What is the name of the federal agency responsible for regulating food safety in the United States?", options: ["FDA", "EPA", "CDC", "USDA"], answerIndex: 0),
        ])
    ]
    
        
//    func getQuestionText() -> String {
//        return allQuestions[questionNumber].title
//    }
   
}


