//
//  UpgradeButton.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 12/05/21.
//

import Foundation
import SpriteKit

enum ButtonType {
    case developer, equipment
}

class UpgradeButton: SKSpriteNode {
    var menu: GeneratorUpgradeMenu
    var price: SKLabelNode
    
    init(menu: GeneratorUpgradeMenu, type: ButtonType) {
        self.menu = menu
        self.price = SKLabelNode(text: "\(menu.generator.currentPrice)")
        super.init(texture: nil, color: UIColor(named: "greenTab")! ,size: CGSize(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.12))
        self.price.horizontalAlignmentMode = .left
        self.price.fontName = "Montserrat-Regular"
        self.price.fontSize = 12
        self.price.fontColor = UIColor(named: "white")
        if type == ButtonType.developer {
            self.name = "developer"
        }
        else if type == ButtonType.equipment {
            self.name = "equipment"
            self.price.text = "\(self.menu.equipment!.currentPrice)"
        }
        self.isUserInteractionEnabled = true
        self.zPosition = 101
        let upgradeLabel = SKLabelNode(text: "Upgrade")
        upgradeLabel.fontName = "Montserrat-SemiBold"
        upgradeLabel.fontSize = 12
        upgradeLabel.position = CGPoint(x: 0, y: self.size.height * 0.05)
        self.addChild(upgradeLabel)
        
        let coinImage: SKSpriteNode = SKSpriteNode(imageNamed: "DevCoin")
        coinImage.size = CGSize(width: 15, height: 15)
        coinImage.position = CGPoint(x: -self.price.frame.width/2, y: -self.size.height*0.2)
        self.price.position = CGPoint(x: coinImage.position.x + coinImage.size.width/2, y: -self.size.height * 0.2 - price.fontSize/2)
        self.addChild(coinImage)
        self.addChild(self.price)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        if node.name == "developer" {
            upgradeDev()
        }
        else if node.name == "equipment" {
            upgradeEquipment()
        }
    }
    
    func upgradeDev() {
        if self.menu.generator.currentPrice <= self.menu.generator.observer.getDevCoins() {
            //enough currency to upgrade dev
            self.menu.generator.observer.updateDevCoins(value: -self.menu.generator.currentPrice)
            self.menu.generator.upgrade()
            self.menu.updateNumbers()
            self.price.text = "\(self.menu.generator.currentPrice)"
            //play song
        }
        else {
            //not enough currency to upgrade dev
            //play song
        }
    }
    
    func upgradeEquipment() {
        if self.menu.equipment!.currentPrice <= self.menu.generator.observer.getDevCoins() {
            //enough currency to upgrade equipment
            self.menu.generator.observer.updateDevCoins(value: -self.menu.equipment!.currentPrice)
            self.menu.equipment!.upgrade()
            self.menu.updateNumbers()
            self.price.text = "\(self.menu.equipment!.currentPrice)"
            if self.menu.equipment!.currentLevel >= self.menu.equipment!.changeVisual1 && self.menu.equipment!.currentLevel < self.menu.equipment!.changeVisual2 {
                if let devsdesk = self.menu.generator as? DevsDesk {
                    devsdesk.desk.texture = SKTexture(imageNamed: "Dev_step_02")
                    //devsdesk.desk.position = CGPoint()
                }
            }
            else if self.menu.equipment!.currentLevel >= self.menu.equipment!.changeVisual2 {
                if let devsdesk = self.menu.generator as? DevsDesk {
                    devsdesk.desk.texture = SKTexture(imageNamed: "Dev_step_03")
                    //devsdesk.desk.position = CGPoint()
                }
            }
            //play song
        }
        else {
            //not enough currency to upgrade equipment
            
            //play song
        }
    }
}
