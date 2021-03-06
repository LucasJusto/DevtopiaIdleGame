import Foundation
import SpriteKit

class PanelButton: SKSpriteNode {
    let text = SKTexture(imageNamed: "Panel")
    var sceneTwo: GameScene
    
    init(scene: GameScene) {
        self.sceneTwo = scene
        super.init(texture: text,
                   color: UIColor(named: "white")! ,
                   size: CGSize(width: text.size().width, height: text.size().height))
        self.position = CGPoint(x: 300, y: 900)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = 1
        self.name = "panelButton"
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scaleDown = SKAction.scale(to: 0.95, duration: 0.05)
        let scaleUp = SKAction.scale(to: 1, duration: 0.05)
        let scaleSequence = SKAction.sequence([scaleDown, scaleUp])
        self.run(scaleSequence)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        if node.name == "panelButton" {
            var isIn = false
            for children in sceneTwo.cameraNode.children {
                if children.name == "managersMenu" {
                    isIn = true
                }
            }
            
            if !isIn {
                SoundController.selectSound(parentNode: self)
                let managersMenu = ManagersMenu(panel: self)
                sceneTwo.cameraNode.addChild(managersMenu)
            }
            
        }
    }
}
