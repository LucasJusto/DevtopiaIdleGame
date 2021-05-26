import Foundation
import SpriteKit

enum ButtonType {
    case developer, equipment
}

class UpgradeButton: SKSpriteNode {
    unowned var menu: GeneratorUpgradeMenu!
    var price: SKLabelNode
    
    init(menu: GeneratorUpgradeMenu, type: ButtonType) {
        self.menu = menu
        self.price = SKLabelNode(text: "\(menu.generator.observer.decimalToString(value: menu.generator.currentPrice))")
        super.init(texture: nil, color: UIColor(named: "greenTab")! ,size: CGSize(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.1))
        self.price.horizontalAlignmentMode = .left
        self.price.fontName = "Montserrat-Regular"
        self.price.fontSize = self.size.height * 0.3
        self.price.fontColor = UIColor(named: "white")
        
        self.isUserInteractionEnabled = true
        self.zPosition = 101
        let upgradeLabel = SKLabelNode(text: "Upgrade")
        upgradeLabel.fontName = "Montserrat-SemiBold"
        upgradeLabel.fontSize = self.size.height * 0.3
        upgradeLabel.position = CGPoint(x: 0, y: self.size.height * 0.05)
        
        
        let coinImage: SKSpriteNode = SKSpriteNode(imageNamed: "DevCoin")
        coinImage.size = CGSize(width: price.fontSize, height: price.fontSize)
        coinImage.position = CGPoint(x: -self.price.frame.width/2, y: -self.size.height*0.2)
        self.price.position = CGPoint(x: coinImage.position.x + coinImage.size.width/2, y: coinImage.position.y - price.fontSize/2 + 1)
        if type == ButtonType.developer {
            self.name = "developer"
            coinImage.name = "developer"
            self.price.name = "developer"
            upgradeLabel.name = "developer"
        }
        else if type == ButtonType.equipment {
            self.name = "equipment"
            coinImage.name = "equipment"
            self.price.name = "equipment"
            upgradeLabel.name = "equipment"
            self.price.text = "\(menu.generator.observer.decimalToString(value: menu.equipment!.currentPrice))"
        }
        self.addChild(coinImage)
        self.addChild(self.price)
        self.addChild(upgradeLabel)
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
            let scaleDown = SKAction.scale(to: 0.95, duration: 0.05)
            let scaleUp = SKAction.scale(to: 1, duration: 0.05)
            let scaleSequence = SKAction.sequence([scaleDown, scaleUp])
            self.run(scaleSequence)
        }
        else if node.name == "equipment" {
            upgradeEquipment()
            let scaleDown = SKAction.scale(to: 0.95, duration: 0.05)
            let scaleUp = SKAction.scale(to: 1, duration: 0.05)
            let scaleSequence = SKAction.sequence([scaleDown, scaleUp])
            self.run(scaleSequence)
        }
    }
    
    func upgradeDev() {
        if self.menu.generator.currentPrice <= self.menu.generator.observer.getDevCoins() {
            //enough currency to upgrade dev
            self.menu.generator.observer.updateDevCoins(value: -self.menu.generator.currentPrice)
            self.menu.generator.upgrade()
            self.menu.updateNumbers()
            self.price.text = "\(menu.generator.observer.decimalToString(value: menu.generator.currentPrice))"
            //play song
            SoundController.upgradeSound(parentNode: self)
        }
        else {
            //not enough currency to upgrade dev
            //play song
            SoundController.insuficientMoneySound(parentNode: self)
        }
    }
    
    func upgradeEquipment() {
        if self.menu.equipment!.currentPrice <= self.menu.generator.observer.getDevCoins() {
            //enough currency to upgrade equipment
            self.menu.generator.observer.updateDevCoins(value: -self.menu.equipment!.currentPrice)
            self.menu.equipment!.upgrade()
            self.menu.updateNumbers()
            self.price.text = "\(menu.generator.observer.decimalToString(value: menu.equipment!.currentPrice))"
            
            if self.menu.equipment!.currentLevel == self.menu.equipment!.changeVisual1 {
                if let devsdesk = self.menu.generator as? DevsDesk {
                    
                    if devsdesk.character == "whiteDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "Dev_step_02")
                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x - 66.5, y: devsdesk.desk.position.y - 30)
                        self.menu.devImage.texture = SKTexture(imageNamed: "Dev_step_02")
                    }
                    else if devsdesk.character == "whiteDesigner" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "Designer_step_02")
                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x + 0.282, y: devsdesk.desk.position.y + 18.608)
                        self.menu.devImage.texture = SKTexture(imageNamed: "Designer_step_02")
                    }
                    else if devsdesk.character == "firstDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "Dev_step_02")
                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x - 66.5, y: devsdesk.desk.position.y - 30)
                        self.menu.devImage.texture = SKTexture(imageNamed: "Dev_step_02")
                        
                    }
                    else if devsdesk.character == "blackDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "blackDev_02")
                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x - 66.5, y: devsdesk.desk.position.y - 30)
                        self.menu.devImage.texture = SKTexture(imageNamed: "blackDev_02")
                    }
                }
            }
            else if self.menu.equipment!.currentLevel == self.menu.equipment!.changeVisual2 {
                if let devsdesk = self.menu.generator as? DevsDesk {
                    
                    if devsdesk.character == "whiteDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "Dev_step_03")
                        self.menu.devImage.texture = SKTexture(imageNamed: "Dev_step_03")
                    }
                    else if devsdesk.character == "whiteDesigner" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "Designer_step_03")
//                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x + 64.8, y: devsdesk.desk.position.y - 33)
                        self.menu.devImage.texture = SKTexture(imageNamed: "Designer_step_03")
                        
                    }
                    else if devsdesk.character == "blackDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "blackDev_03")
                        self.menu.devImage.texture = SKTexture(imageNamed: "blackDev_03")
                    }
                }
            }
            else if self.menu.equipment!.currentLevel == 0 {
                if let devsdesk = self.menu.generator as? DevsDesk {
                    if devsdesk.character == "whiteDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "whiteDevBlur")
                        self.menu.devImage.texture = SKTexture(imageNamed: "whiteDevBlur")
                    }
                    else if devsdesk.character == "whiteDesigner" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "whiteDesignerBlur")
//                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x + 64.8, y: devsdesk.desk.position.y - 33)
                        self.menu.devImage.texture = SKTexture(imageNamed: "whiteDesignerBlur")
                        
                    }
                    else if devsdesk.character == "firstDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "whiteDevBlur")
                        self.menu.devImage.texture = SKTexture(imageNamed: "whiteDevBlur")
                        
                    }
                    else if devsdesk.character == "blackDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "blackDevBlur")
//                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x + 64.8, y: devsdesk.desk.position.y - 33)
                        self.menu.devImage.texture = SKTexture(imageNamed: "blackDevBlur")
                    }
                }
            }
            
            else {
                if let devsdesk = self.menu.generator as? DevsDesk {
                    if devsdesk.character == "whiteDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "Dev_step_01-1")
                        self.menu.devImage.texture = SKTexture(imageNamed: "Dev_step_01-1")
                    }
                    else if devsdesk.character == "firstDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "Dev_step_01-1")
                        self.menu.devImage.texture = SKTexture(imageNamed: "Dev_step_01-1")
                        
                    }
                    else if devsdesk.character == "whiteDesigner" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "Designer_step_01")
//                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x + 64.8, y: devsdesk.desk.position.y - 33)
                        self.menu.devImage.texture = SKTexture(imageNamed: "Designer_step_01")
                        
                    }
                    else if devsdesk.character == "blackDev" {
                        devsdesk.desk.texture = SKTexture(imageNamed: "blackDev_01")
//                        devsdesk.desk.position = CGPoint(x: devsdesk.desk.position.x + 64.8, y: devsdesk.desk.position.y - 33)
                        self.menu.devImage.texture = SKTexture(imageNamed: "blackDev_01")
                    }
                }
            }
            
            //play song
            SoundController.upgradeSound(parentNode: self)
        }
        else {
            //not enough currency to upgrade equipment
            
            //play song
            SoundController.insuficientMoneySound(parentNode: self)
        }
    }
}
