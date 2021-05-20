import Foundation
import SpriteKit

class PanelButton: SKSpriteNode {
    
    init() {
        super.init(texture: SKTexture(imageNamed: "Panel"), color: UIColor(named: "white")! ,size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.position = CGPoint(x: 0, y: UIScreen.main.bounds.height)
        self.name = "panelButton"
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
        if node.name == "panelButton" {
            
        }
    }
}
