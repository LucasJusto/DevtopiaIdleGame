//
//  SoundController.swift
//  DevTopia
//
//  Created by Guilherme Valent Antonini on 12/05/21.
//

import Foundation
import SpriteKit
import AVFoundation

let SoundState = "SoundState"


class SoundController: SKAudioNode {
    
    
    public var audioPlayer: AVAudioPlayer?

    public func playSoundLoop(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.volume = 0.05
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }

    public func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.numberOfLoops = 2
                audioPlayer?.volume = 0.25
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }
    
    func setSounds(_ state:Bool) {
        UserDefaults.standard.set(state, forKey: SoundState)
        UserDefaults.standard.synchronize()
    }
    
    func getSound() -> Bool {
        return UserDefaults.standard.bool(forKey: SoundState)
    }
    
    
    
    
    
    
}
