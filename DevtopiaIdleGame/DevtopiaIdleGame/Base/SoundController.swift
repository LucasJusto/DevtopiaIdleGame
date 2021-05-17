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
        let sound = SKAudioNode(fileNamed: "typing.wav")
        sound.isPositional = false
        sound.autoplayLooped = false
        parent.addChild(sound)
        sound.run(SKAction.sequence([.play(), .wait(forDuration: 0.5)])){
            sound.removeFromParent()
        }
    }
    
}
