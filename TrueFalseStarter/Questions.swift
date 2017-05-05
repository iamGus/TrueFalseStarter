//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by Angus Muller on 11/04/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// Create blank template for each question

struct QuestionTemplate {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var realAnswer: String
}

// Store questions and func for returning random question index number

class Questions {
    var question: [QuestionTemplate] =
        [QuestionTemplate(
            question: "What is Picard's favourite drink?",
            answer1: "Tea, Earl Grey, Hot",
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
            question: "Where was Picard raised?",
            answer1: "Not from earth",
            answer2: "USA",
            answer3: "United Kingdom",
            answer4: "France",
            realAnswer: "answer4"),
        QuestionTemplate(
            question: "What was Picard's name when he was a Borg?",
            answer1: "Seven of Nine",
            answer2: "The One",
            answer3: "Locutus",
            answer4: "Max",
            realAnswer: "answer3"),
        QuestionTemplate(
            question: "What was the first ship Picard commanded?",
            answer1: "USS Stargazer",
            answer2: "USS Sunshine",
            answer3: "USS Crazyhourse",
            answer4: "USS Madman",
            realAnswer: "answer1"),
        QuestionTemplate(
            question: "Where did the nausicaan stab Captain Picard?",
            answer1: "In the back",
            answer2: "In the heart",
            answer3: "In the arm",
            answer4: "In the leg",
            realAnswer: "answer2"),
        QuestionTemplate(
            question: "Name of Picard's brother?",
            answer1: "Jack",
            answer2: "Tron",
            answer3: "Maximus",
            answer4: "Robert",
            realAnswer: "answer4"),
        QuestionTemplate(
            question: "What is Picard's starship battle tactic known as?",
            answer1: "The Attack Maneuver",
            answer2: "The In Out Maneuver",
            answer3: "The Picard Maneuver",
            answer4: "The stealth Maneuver",
            realAnswer: "answer3"),
        QuestionTemplate(
            question: "What type of holodeck games does Picard enjoy?",
            answer1: "Detective stories",
            answer2: "Klingon Bat'leth Battles",
            answer3: "Viking Stories",
            answer4: "Line Dancing",
            realAnswer: "answer1"),
        QuestionTemplate(
            question: "Name of who is Picard's nephew?",
            answer1: "Jack",
            answer2: "René",
            answer3: "James",
            answer4: "Luan",
            realAnswer: "answer2")
    ]
    
    // Function to return random question index number
    func randomQuestionGenerator(reset: Bool) -> () -> Int {
        var questionsLeft = [Int]() // Counter to store number of questions and remove to stop duplicate
        let maxRange = self.question.count - 1 // get max possible questions
        return {
            if questionsLeft.count == 0 || reset == true {
                questionsLeft = Array(0 ... maxRange) // Reset questionsLeft counter back to amount of questions
            }
            
            let index = Int(arc4random_uniform(UInt32(questionsLeft.count))) //Get random number from counter
            print(questionsLeft.count) // For internal to check working correctly
            return questionsLeft.remove(at: index) // Return random question index number
        }
    }
}

