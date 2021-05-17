//
//  CloseButton.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 12/05/21.
//

import Foundation
import SpriteKit

class CloseButton: SKSpriteNode {
    weak var menu: GeneratorUpgradeMenu?
    
    init(menu: GeneratorUpgradeMenu?) {
        self.menu = menu
        super.init(texture: SKTexture(imageNamed: "Close_Button"), color: UIColor(named: "white")! ,size: CGSize(width: UIScreen.main.bounds.width * 0.07, height: UIScreen.main.bounds.width * 0.07))
        self.name = "closeButton"
        self.isUserInteractionEnabled = true
        self.zPosition = 101
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        if node.name == "closeButton" {
            self.menu?.removeFromParent()
        }
    }
}
