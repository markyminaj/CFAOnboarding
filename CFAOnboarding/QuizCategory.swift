//
//  QuizCategory.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/23/23.
//

import UIKit

struct QuizCategory {
    var title: String
    var description: String
    var completionPercent: Float
    var completed: Bool
    var image: UIImage?
    var questions: [Question]
}
