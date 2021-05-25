//
//  PanelClose.swift
//  DevTopia
//
//  Created by Lucas Dimer Justo on 25/05/21.
//

import Foundation
import SpriteKit

class PanelClose: SKSpriteNode {
    weak var comingSoon: ManagersMenu?
    
    init(comingSoon: ManagersMenu, width: CGFloat, height: CGFloat) {
        self.comingSoon = comingSoon
        super.init(texture: nil, color: UIColor(named: "greenTab")! ,size: CGSize(width: width, height: height))
        self.name = "panelClose"
        self.isUserInteractionEnabled = true
        self.zPosition = .infinity
        let closeLabel: SKLabelNode = SKLabelNode(text: "Close")
        closeLabel.fontName = "Montserrat-Bold"
        closeLabel.fontSize = self.size.height * 0.5
        closeLabel.fontColor = UIColor(named: "white")!
        closeLabel.verticalAlignmentMode = .center
        closeLabel.name = "panelClose"
        self.addChild(closeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        if node.name == "panelClose" {
            SoundController.selectSound(parentNode: comingSoon?.panelTwo ?? SKNode())
            self.comingSoon?.removeFromParent()
        }
    }
}
