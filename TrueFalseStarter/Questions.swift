//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by Angus Muller on 11/04/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

struct QuestionTemplate {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var realAnswer: String
}

struct Questions {
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
            answer1: "France",
            answer2: "USA",
            answer3: "United Kinddom",
            answer4: "Not from earth",
            realAnswer: "answer1")
    ]
}

