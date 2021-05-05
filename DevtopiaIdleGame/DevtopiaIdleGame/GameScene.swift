//
//  GameScene.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 03/05/21.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        let desk = DevsDesk()
        addChild(desk)
        
    }
    
}


