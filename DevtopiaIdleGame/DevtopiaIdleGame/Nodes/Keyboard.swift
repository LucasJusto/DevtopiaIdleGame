import Foundation
import SpriteKit
import AudioToolbox

class KeyboardButton: SKSpriteNode {
    var mainCurrency: MainCurrency
    
    init(mainCurrency: MainCurrency) {
        self.mainCurrency = mainCurrency
        super.init(texture: SKTexture(imageNamed: "Keyboard"), color: UIColor(named: "white")! ,size: CGSize(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.1))
        self.position = CGPoint(x: 0, y: (UIScreen.main.bounds.height * -0.43) + self.size.height/2)
        self.name = "keyboardButton"
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
        if node.name == "keyboardButton" {
            
            //            let keyboard = KeyboardButton(mainCurrency: self.mainCurrency)
            //            let animationKeyboard = SKAction.scale(by: 0.5, duration: 1)
            //            keyboard.run(animationKeyboard) {
            //                keyboard.removeFromParent()
            //            }
            
            
            self.mainCurrency.updateDevCoins(value: mainCurrency.getDevCoinsPerSec() * 0.2)
            let coin = KeyboardCoin(mainCurrency: self.mainCurrency)
            if let location = location {
                let maxValue = self.frame.width * 0.90 / 2 - coin.frame.width / 2
                if location.x > 0 && abs(location.x) > maxValue {
                    coin.position = CGPoint(x: maxValue, y: 0)
                }
                else if location.x < 0 && abs(location.x) > maxValue{
                    coin.position = CGPoint(x: -maxValue, y: 0)
                }
                else {
                    coin.position = CGPoint(x: location.x, y: 0)
                }
            }
            self.addChild(coin)
            coin.zPosition = -1
            let duration = 1.3
            let moveUp = SKAction.moveBy(x: 0, y: self.frame.height, duration: duration)
            moveUp.timingMode = .easeOut
            let wait = SKAction.wait(forDuration: duration / 2)
            let fadeOut = SKAction.fadeOut(withDuration: duration / 2)
            let fadeOutSequence = SKAction.sequence([wait, fadeOut])
            let groupAction = SKAction.group([moveUp, fadeOutSequence])
            
            coin.run(groupAction) {
                coin.removeFromParent()
            }
            
            let scaleDown = SKAction.scale(to: 0.95, duration: 0.05)
            let scaleUp = SKAction.scale(to: 1, duration: 0.05)
            let scaleSequence = SKAction.sequence([scaleDown, scaleUp])
            let playKeyboardSound = SKAction.run {
                            
                SoundController.keyboardClick(parent: self)
            }
            let scaleGroup = SKAction.group([playKeyboardSound, scaleSequence])
            self.run(scaleGroup)
            
        }
    }
    
    
}
