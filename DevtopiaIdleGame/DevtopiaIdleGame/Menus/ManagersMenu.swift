import Foundation
import SpriteKit

class ManagersMenu: SKSpriteNode {
    var panelTwo: PanelButton
    init(panel: PanelButton) {
        self.panelTwo = panel
        super.init(texture: nil, color: UIColor(named: "white")!, size: CGSize(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.5))
        self.zPosition = 500
        self.name = "managersMenu"
        self.isUserInteractionEnabled = true
        let blackRectangle: SKSpriteNode = SKSpriteNode(texture: nil, color: UIColor(named: "black")!, size: CGSize(width: self.size.width * 0.95, height: self.size.height * 0.95))
        let newFeaturesLabel: SKLabelNode = SKLabelNode(text: "New features")
        newFeaturesLabel.fontName = "Montserrat-SemiBold"
        newFeaturesLabel.fontColor = UIColor(named: "white")
        newFeaturesLabel.fontSize = self.size.height * 0.08
        newFeaturesLabel.position = CGPoint(x: 0, y: self.size.height * 0.33)
        
        let comingSoonLabel: SKLabelNode = SKLabelNode(text: "coming soon!")
        comingSoonLabel.fontName = "Montserrat-SemiBold"
        comingSoonLabel.fontColor = UIColor(named: "white")
        comingSoonLabel.fontSize = self.size.height * 0.08
        comingSoonLabel.position = CGPoint(x: 0, y: newFeaturesLabel.position.y - comingSoonLabel.fontSize)
        
        let devImage: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "Designer_step_03"), color: UIColor(named: "white")!, size: CGSize(width: self.size.width * 0.75, height: self.size.height * 0.55))
        devImage.position = CGPoint(x: 0, y: comingSoonLabel.position.y - devImage.size.height/2)
        
        let closePanelButton = PanelClose(comingSoon: self, width: self.size.width * 0.75, height: UIScreen.main.bounds.height * 0.05)
        closePanelButton.position = CGPoint(x: 0, y: devImage.position.y - devImage.size.height/2 - closePanelButton.size.height/2)
        
        self.addChild(blackRectangle)
        self.addChild(newFeaturesLabel)
        self.addChild(comingSoonLabel)
        self.addChild(devImage)
        self.addChild(closePanelButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
