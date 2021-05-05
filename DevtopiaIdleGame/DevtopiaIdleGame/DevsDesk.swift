//
//  DevsDesk.swift
//  DevtopiaIdleGame
//
//  Created by Enzo Degrazia on 05/05/21.
//

import Foundation
import SpriteKit

class DevsDesk: SKNode{
    
    private lazy var desk: SKSpriteNode = {
        let desk = SKSpriteNode(imageNamed: "Dev_step_01")
        //setter da posição do dev para a posição x: 0.5 , y: 0.5
        desk.position = CGPoint(x: 0.5,y: 0.5)
        //setter da anchorPoint do dev para a posição x: 0.5 , y: 0.5
        desk.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        desk.zPosition = 1
        desk.name = "desk"
        //desk.size = CGSize(width: 500, height: 500
        return desk
    }()
    
    override init() {
        super.init()
        isUserInteractionEnabled = true
        addChild(desk)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        
        if node.name == "desk" {
            print("matheus") //ação do botao
        }
    }
    
}
