//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by Angus Muller on 11/04/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct QuestionTemplate {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var realAnswer: String
}

class Questions {
    var question: [QuestionTemplate] =
        [QuestionTemplate(
            question: "What is Picard's faviout drink?",
            answer1: "Tea earl grey hot",
            answer2: "Spice apple",
            answer3: "Vodka",
            answer4: "Strong black coffee",
            realAnswer: "answer1"),
         QuestionTemplate(
            question: "What is Picard's favourite hobby?",
            answer1: "Sky Diving",
            answer2: "Archaeology",
            answer3: "Cooking",
            answer4: "Walking on beaches",
            realAnswer: "answer2"),
         QuestionTemplate(
            question: "Which country is Picard from?",
            answer1: "Not from earth",
            answer2: "USA",
            answer3: "United Kinddom",
            answer4: "France",
            realAnswer: "answer4")
    ]
    
    
    func randomQuestionGenerator(max: Int) -> () -> Int {
        var questionsLeft = [Int]() // Questions available to use counter
        return {
            if questionsLeft.count == 0 {
                questionsLeft = Array(0 ... max) // Reset questionsLeft counter back to amount of questions
            }
            
            let index = Int(arc4random_uniform(UInt32(questionsLeft.count)))
            return questionsLeft.remove(at: index)
        }
    }
}

