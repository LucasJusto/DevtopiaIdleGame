//
//  SoundController.swift
//  DevTopia
//
//  Created by Guilherme Valent Antonini on 12/05/21.
//

import Foundation
import SpriteKit

let SoundState = "SoundState"


class SoundController: SKAudioNode {
    
    func setSounds(_ state:Bool) {
        UserDefaults.standard.set(state, forKey: SoundState)
        UserDefaults.standard.synchronize()
    }
    
    func getSound() -> Bool {
        return UserDefaults.standard.bool(forKey: SoundState)
    }
    
    
    
    
    
    
}
