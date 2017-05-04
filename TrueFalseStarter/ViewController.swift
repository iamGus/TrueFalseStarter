//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    //NOTE: Set veribles - might moves these to own file with related code
    
    let questionsPerRound = 3 // How many questions to ask
    var questionsAsked = 0 // Counter keeping track how many questions asked
    var correctQuestions = 0 // Counter keeping track of score
    var indexOfSelectedQuestion: Int = 0 // This is just a default value that gets replaced with a random key from array.
    let getRandomNumber = Questions().randomQuestionGenerator(max: 2)
    var gameSound: SystemSoundID = 0 // ?
        
    // Buttons
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound() //Loading sound
        // Start game
        playGameStartSound() // Playing sound, wonder if can have loasd and play into one class pulled from another file.
        
        displayQuestion() // to me this is start of game and sets first question in motion
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Showing question on screen
    
    
    func displayQuestion() {
        
        
        indexOfSelectedQuestion = getRandomNumber() // get random number from array
        
        let questionDictionary = Questions().question[indexOfSelectedQuestion] // pull out that random fact using the random number
        questionField.text = questionDictionary.question // Display the pulled out fact in label
        playAgainButton.isHidden = true // hide the play again button
        // Need to update 4 answer buttons with answers
        answer1Button.setTitle(questionDictionary.answer1, for: .normal)
        answer2Button.setTitle(questionDictionary.answer2, for: .normal)
        answer3Button.setTitle(questionDictionary.answer3, for: .normal)
        answer4Button.setTitle(questionDictionary.answer4, for: .normal)
    }
    
    // This func seems to be showing score and hiding other buttons, modify func and move into own file
    
    func displayScore() {
        // Hide the four answer buttons while display score
        answer1Button.isHidden = true
        answer2Button.isHidden = true
        answer3Button.isHidden = true
        answer4Button.isHidden = true
        
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    //When one of answer buttons clicked do the below
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = Questions().question[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.realAnswer
        
        //logic for if button was pressed was the correct answer
        if (sender === answer1Button && correctAnswer == "answer1") || (sender === answer2Button && correctAnswer == "answer2") || (sender === answer3Button && correctAnswer == "answer3") || (sender === answer4Button && correctAnswer == "answer4") {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    // checks if game is srill ongoing comparing how many questions asked copared to round counter
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    // when the play again button is shown
    @IBAction func playAgain() {
        // Show the answer buttons
        answer1Button.isHidden = false
        answer2Button.isHidden = false
        answer3Button.isHidden = false
        answer4Button.isHidden = false
        
        // reset question counters
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    // Delay function, move to own file
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    // game sound files, move to own file and lok into adding more sounds
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

