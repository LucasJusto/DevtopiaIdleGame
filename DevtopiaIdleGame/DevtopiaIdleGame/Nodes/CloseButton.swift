import Foundation
import SpriteKit

class CloseButton: SKSpriteNode {
    weak var menu: GeneratorUpgradeMenu?
    
    init(menu: GeneratorUpgradeMenu?, width: CGFloat, height: CGFloat) {
        self.menu = menu
        super.init(texture: SKTexture(imageNamed: "Close_Button"), color: UIColor(named: "white")! ,size: CGSize(width: width, height: height))
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
            //SoundController.selectSound(parentNode: menu!)
            self.menu?.removeFromParent()
        }
    }
}
