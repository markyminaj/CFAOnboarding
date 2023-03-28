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
    
    let categories: [QuizCategory] = [
        QuizCategory(title: "Chick-fil-A Trivia", description: "Test your knowledge of Chick-fil-A trivia!", completionRate: 0.5, completed: false, image: UIImage(systemName: "person"), questions: []),
        QuizCategory(title: "Food Safety", description: "Think you know everything about fast food? Take this quiz and find out!", completionRate: 0.25, completed: true, image: UIImage(systemName: "person"), questions: []),
//        QuizCategory(title: "Food Quality", description: "How well do you know your history? Take this quiz and find out!", completionRate: 0.75, completed: false, image: UIImage(systemName: "person")),
//        QuizCategory(title: "Hospitality", description: "How well do you know your history? Take this quiz and find out!", completionRate: 0.75, completed: false, image: UIImage(systemName: "person")),
//        QuizCategory(title: "People and Places", description: "How well do you know your history? Take this quiz and find out!", completionRate: 0.75, completed: false, image: UIImage(systemName: "person")),
//        QuizCategory(title: "Procedures", description: "How well do you know your history? Take this quiz and find out!", completionRate: 0.75, completed: false, image: UIImage(systemName: "person")),
//        QuizCategory(title: "2nd Mile Service", description: "How well do you know your history? Take this quiz and find out!", completionRate: 0.75, completed: false, image: UIImage(systemName: "person"))
    ]
    
    let allQuestions = [
        Question(question: "What does Chick-fil-A's 'Second Mile Service' mean?", options: ["Going above and beyond in serving customers", "Providing free food to customers", "Selling high-quality products", "Offering discounts to repeat customers"], answerIndex: 0, category: "Trivia"),
        
        Question(question: "What is the name of Chick-fil-A's founder?", options: ["Dan Cathy", "Sam Walton", "Ray Kroc", "Truett Cathy"], answerIndex: 3, category: "Trivia"),
        
        Question(question: "Which day of the week is Chick-fil-A closed?", options: ["Monday", "Tuesday", "Wednesday", "Sunday"], answerIndex: 3, category: "Trivia"),
        
        Question(question: "What is the name of Chick-fil-A's famous sandwich?", options: ["Big Mac", "Whopper", "Original Chicken Sandwich", "Double Down"], answerIndex: 2, category: "Trivia"),
        
        Question(question: "How many sauce dips do we have?", options: ["8", "5", "10", "7"], answerIndex: 3, category: "Trivia"),
        
        Question(question: "How many seconds should you wash your hands at a minimum?", options: ["20", "10", "60", "45"], answerIndex: 0, category: "Food Safety"),
        
        Question(question: "Which city did Chick-fil-A originate?", options: ["New York", "San Diego", "Atlanta", "Austin"], answerIndex: 2, category: "Trivia"),
        
        Question(question: "What year did the Spicy Sandwich originate", options: ["2000", "2010", "1984", "1996"], answerIndex: 1, category: "Trivia"),
        
        Question(question: "What is the temperature range that food should be stored at to prevent the growth of bacteria?", options: ["0-32°F", "33-41°F", "42-50°F", "51-60°F"], answerIndex: 1, category: "Food Safety"),

        Question(question: "Which of the following is NOT a common foodborne illness?", options: ["Norovirus", "Salmonella", "E. coli", "Lyme disease"], answerIndex: 3, category: "Food Safety"),

        Question(question: "What is the maximum amount of time that cooked food can be left out at room temperature before it should be thrown away?", options: ["1 hour", "2 hours", "3 hours", "4 hours"], answerIndex: 1, category: "Food Safety"),

        Question(question: "What is the name of the process used to kill bacteria and other harmful microorganisms in food?", options: ["Pasteurization", "Filtration", "Distillation", "Irradiation"], answerIndex: 0, category: "Food Safety"),

        Question(question: "Which of the following is a sign of good food quality?", options: ["Dry, tough texture", "Foul odor", "Discoloration", "Fresh appearance"], answerIndex: 3, category: "Food Safety"),

        Question(question: "What is the name of the program Chick-fil-A uses to ensure the quality and safety of its food?", options: ["Good Manufacturing Practices", "Hazard Analysis and Critical Control Points", "Safe Quality Food", "Food Safety Modernization Act"], answerIndex: 2, category: "Food Safety"),

        Question(question: "What is the temperature that chicken should be cooked to in order to ensure it is safe to eat?", options: ["145°F", "160°F", "175°F", "190°F"], answerIndex: 1, category: "Food Safety"),

        Question(question: "What is the name of the federal agency responsible for regulating food safety in the United States?", options: ["FDA", "EPA", "CDC", "USDA"], answerIndex: 0, category: "Food Safety"),
    ]
    
    let triviaQuestions = [
        Question(question: "What does Chick-fil-A's 'Second Mile Service' mean?", options: ["Going above and beyond in serving customers", "Providing free food to customers", "Selling high-quality products", "Offering discounts to repeat customers"], answerIndex: 0, category: "Trivia"),
        
        Question(question: "What is the name of Chick-fil-A's founder?", options: ["Dan Cathy", "Sam Walton", "Ray Kroc", "Truett Cathy"], answerIndex: 3, category: "Trivia"),
        
        Question(question: "Which day of the week is Chick-fil-A closed?", options: ["Monday", "Tuesday", "Wednesday", "Sunday"], answerIndex: 3, category: "Trivia"),
        
        Question(question: "What is the name of Chick-fil-A's famous sandwich?", options: ["Big Mac", "Whopper", "Original Chicken Sandwich", "Double Down"], answerIndex: 2, category: "Trivia"),
        
        Question(question: "How many sauce dips do we have?", options: ["8", "5", "10", "7"], answerIndex: 3, category: "Trivia"),
    ]
        
    func getQuestionText() -> String {
        return allQuestions[questionNumber].question
    }
   
}
