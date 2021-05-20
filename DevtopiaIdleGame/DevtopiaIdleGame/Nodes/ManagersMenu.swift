import Foundation
import SpriteKit

class ManagersMenu: SKSpriteNode {
    let menu = SKTexture(imageNamed: "New_Features")
    var panelTwo: PanelButton
    init(panel: PanelButton) {
        self.panelTwo = panel
        super.init(texture: menu, color: UIColor(named: "white")!, size: CGSize(width: menu.size().width * 0.5, height: menu.size().height * 0.5))
        self.zPosition = 200
        self.name = "managersMenu"
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        if node.name == "managersMenu" {
            SoundController.selectSound(parentNode: panelTwo)
            self.removeFromParent()
        }
    }
}
