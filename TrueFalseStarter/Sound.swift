//
//  Sound.swift
//  TrueFalseStarter
//
//  Created by Angus Muller on 04/05/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import AudioToolbox

/*
 ------------------------------------
 Loading and playing sounds functions
 ------------------------------------
 */

var gameSound: SystemSoundID = 0

func loadGameStartSound(soundFile: String, soundType: String) {
    let pathToSoundFile = Bundle.main.path(forResource: soundFile, ofType: soundType)
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
}

func playGameStartSound() {
    AudioServicesPlaySystemSound(gameSound)
}
