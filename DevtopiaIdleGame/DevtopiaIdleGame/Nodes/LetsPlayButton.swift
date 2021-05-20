//
//  LetsPlayButton.swift
//  DevTopia
//
//  Created by Lucas Dimer Justo on 20/05/21.
//

import Foundation
import SpriteKit

class LetsPlaybutton: SKSpriteNode {
    unowned var popUp: WelcomeBackPopUp
    
    init(popUp: WelcomeBackPopUp) {
        self.popUp = popUp
        super.init(texture: nil, color: UIColor(named: "greenTab")! ,size: CGSize(width: popUp.size.width * 0.9, height: popUp.size.height * 0.2))
        let y = -popUp.size.height * 0.5 + popUp.size.width * 0.05 + self.size.height/2
        self.position = CGPoint(x: 0, y: y)
        self.isUserInteractionEnabled = true
        self.name = "letsPlayButton"
        
        let letsPlayLabel = SKLabelNode(text: "Let's Play!")
        letsPlayLabel.fontSize = self.size.height/4
        letsPlayLabel.fontColor = UIColor(named: "white")
        letsPlayLabel.fontName = "Montserrat-Regular"
        letsPlayLabel.verticalAlignmentMode = .center
        self.addChild(letsPlayLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        
        if node.name == self.name {
            popUp.mainCurrency.updateDevCoins(value: popUp.value)
            popUp.removeFromParent()
        }
    }
}
