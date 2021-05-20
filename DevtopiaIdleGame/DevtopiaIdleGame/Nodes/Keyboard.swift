import Foundation
import SpriteKit

class KeyboardButton: SKSpriteNode {
    var mainCurrency: MainCurrency
    
    init(mainCurrency: MainCurrency) {
        self.mainCurrency = mainCurrency
        super.init(texture: SKTexture(imageNamed: "Keyboard"), color: UIColor(named: "white")!, size: CGSize(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.1))
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
            self.mainCurrency.updateDevCoins(value: mainCurrency.getDevCoinsPerSec() * 0.2)
            SoundController.keyboardClick(parent: self)
        }
    }
}
