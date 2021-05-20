import Foundation
import SpriteKit

class ManagersMenu: SKSpriteNode {
    let menu = SKTexture(imageNamed: "New_Features")
    
    init() {
        super.init(texture: menu, color: UIColor(named: "white")!, size: CGSize(width: menu.size().width, height: menu.size().height))
        self.zPosition = 200
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
