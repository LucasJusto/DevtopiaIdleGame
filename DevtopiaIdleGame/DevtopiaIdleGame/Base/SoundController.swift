//
//  SoundController.swift
//  DevTopia
//
//  Created by Guilherme Valent Antonini on 12/05/21.
//

import Foundation
import SpriteKit

public class SoundController {
    
     static func backgroundMusic(parentNode: SKNode){
  
        let sound = SKAudioNode(fileNamed: "backgroundMusic.wav")
        sound.isPositional = false
        sound.autoplayLooped = true
        parentNode.addChild(sound)
        sound.run(SKAction.play())
    }
    
    static func selectSound(parentNode: SKNode){
        
        let sound = SKAudioNode(fileNamed: "selectSound.wav")
        sound.isPositional = false
        sound.autoplayLooped = false
        parentNode.addChild(sound)
        sound.run(SKAction.sequence([.play(), .wait(forDuration: 0.5)])){
            sound.removeFromParent()
        }
    }
    
    static func upgradeSound(parentNode: SKNode){
        
        let sound = SKAudioNode(fileNamed: "upgradeVisualSound.wav")
        sound.isPositional = false
        sound.autoplayLooped = false
        parentNode.addChild(sound)
        sound.run(SKAction.sequence([.play(), .wait(forDuration: 2)])){
            sound.removeFromParent()
        }
        
    }
    
    static func insuficientMoneySound(parentNode: SKNode){
        
        let sound = SKAudioNode(fileNamed: "insuficientMoney.wav")
        sound.isPositional = false
        sound.autoplayLooped = false
        parentNode.addChild(sound)
        sound.run(SKAction.sequence([.play(), .wait(forDuration: 0.5)])){
            sound.removeFromParent()
        }
    }
    
    
    static func keyboardClick(parent: SKSpriteNode){
        let soundOne = SKAudioNode(fileNamed: "sound1.wav")
        let soundTwo = SKAudioNode(fileNamed: "sound2.wav")
        let soundThree = SKAudioNode(fileNamed: "sound3.wav")
        let soundFour = SKAudioNode(fileNamed: "sound4.wav")
        
        let sounds: [SKAudioNode] = [soundOne, soundTwo, soundThree, soundFour]
        for sound in sounds {
            sound.isPositional = false
            sound.autoplayLooped = false
            parent.addChild(sound)
        }
        guard let sound = sounds.randomElement() else { return }
        
        sound.run(SKAction.sequence([.play(), .wait(forDuration: 0.5)])){
            sound.removeFromParent()
        }
    }
    
}
