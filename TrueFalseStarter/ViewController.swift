//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Modified and enhanced by Angus Muller on 4/5/17
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties parameters and defaults set
    
    let questionsPerRound = 10 // How many questions in a round to ask
    var questionsAsked = 0 // Counter keeping track how many questions asked
    var correctQuestions = 0 // Counter keeping track of score
    var indexOfSelectedQuestion: Int = 0 // This is just a default value that gets replaced with a random key from array.
    let getRandomNumber = Questions().randomQuestionGenerator() // Instance set for generating random question
  
        
    // Buttons
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var picardWin: UIImageView!
    @IBOutlet weak var picardLose: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound(soundFile: "Start", soundType: "mp3") //Loading starting sound
        playGameStartSound() // Play starting sound
        
        
        /*
        ------------
        Start game
        ------------
        */
        
        displayQuestion() // Show first question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* 
     -----------------------------------------------------------------------------
     Showing each question on screen: Get Random question, update question field,
     add each possible answer into the four buttons
     -----------------------------------------------------------------------------
    */
    
    func displayQuestion() {
        
        
        indexOfSelectedQuestion = getRandomNumber() // get random question number
        let questionDictionary = Questions().question[indexOfSelectedQuestion] // pull out that random fact using the random number
        questionField.text = questionDictionary.question // Display the pulled out fact in label
        playAgainButton.isHidden = true // Hide the play again button
        // Update the four answer buttons with possible answers
        answer1Button.setTitle(questionDictionary.answer1, for: .normal)
        answer2Button.setTitle(questionDictionary.answer2, for: .normal)
        answer3Button.setTitle(questionDictionary.answer3, for: .normal)
        answer4Button.setTitle(questionDictionary.answer4, for: .normal)
    }
    
    
    /* 
     ------------------------------------------
     Display score, hiding question buttons and 
     show play again button
     ------------------------------------------
    */
    
    func displayScore() {
        // Hide the four answer buttons
        answer1Button.isHidden = true
        answer2Button.isHidden = true
        answer3Button.isHidden = true
        answer4Button.isHidden = true
        
        
        // Display play again button
        playAgainButton.isHidden = false
        
        if correctQuestions >= 8 { // If 8 or more question correct show positive Picard
          questionField.text = "Make it so!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
              picardWin.isHidden = false
        } else { // else if score is less than 3 correct answers then show sad Picard
        questionField.text = "Oh dear!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
            picardLose.isHidden = false
        }
    }
    
    /*
     ---------------------------------------------------------
     When an answer button clicked, check answer, update score
     and show next round.
     ---------------------------------------------------------
    */
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        //Get the real answer
        let selectedQuestionDict = Questions().question[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.realAnswer
        
        //logic for if button was pressed was the correct answer
        if (sender === answer1Button && correctAnswer == "answer1") || (sender === answer2Button && correctAnswer == "answer2") || (sender === answer3Button && correctAnswer == "answer3") || (sender === answer4Button && correctAnswer == "answer4") {
            correctQuestions += 1
            questionField.text = "Correct!"
            loadGameStartSound(soundFile: "Correct", soundType: "mp3")
            playGameStartSound()
        } else { // if button pressed was the wrong answer
            questionField.text = "Sorry, wrong answer!"
            loadGameStartSound(soundFile: "Wrong", soundType: "mp3")
            playGameStartSound()
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    /*
     -------------------------------------------------------------
     Check if all rounds have been completed, if so display score,
     otherwise if not then display next round (question)
     -------------------------------------------------------------
    */
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game, display next question
            displayQuestion()
        }
    }
    
    /*
     -------------------------------------
     When the play again button is clicked
     -------------------------------------
    */
    
    @IBAction func playAgain() {
        // Show the answer buttons
        answer1Button.isHidden = false
        answer2Button.isHidden = false
        answer3Button.isHidden = false
        answer4Button.isHidden = false
        
        //Hide Picard faces
        picardWin.isHidden = true
        picardLose.isHidden = true
        
        // Reset question counters
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    // Delay displaying next round
    
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
    
}

