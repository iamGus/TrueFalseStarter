//
//  RandomQuestion.swift
//  TrueFalseStarter
//
//  Created by Angus Muller on 25/04/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//
/*
import Foundation

class RandomQuestionOrder {
    var questionsLeft: [Int] = [0, 1, 2, 3] // Questions available to use counter
    
   // init() {
  //      questionsLeft = [1, 2, 3]
  //  }
    
    func randomQuestionGenerator(max: Int) -> () -> Int {
        return {
            if self.questionsLeft.count == 0 {
                self.questionsLeft = Array(0 ... max) // Reset questionsLeft counter back to amount of questions
            }
            
            let index = Int(arc4random_uniform(UInt32(self.questionsLeft.count)))
            return self.questionsLeft.remove(at: index)
        }
    }
    
}
*/
