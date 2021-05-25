import Foundation
import SpriteKit

protocol DevDelegate: AnyObject {
    func didTapDev(character: Generator)
}

class DevsDesk: SKNode, Generator{
    
    var character: String
    var characterAsset: String = ""
    var anchorPoint: CGPoint = CGPoint(x: 0.0, y: 0.0 )
    var perSec: Decimal
    var multipliers: [Multiplier]
    var id: Int
    var currentPrice: Decimal
    var basePrice: Decimal
    var currentLevel: Int
    var increase: Decimal
    var observer: MainCurrency
    weak var delegate: DevDelegate?
    var equipment: Equipment
    
    public lazy var desk: SKSpriteNode = {
        

        if character == "whiteDev" {
            
            anchorPoint = CGPoint(x: 0.458, y: 0.5 )
            if self.equipment.currentLevel >= equipment.changeVisual1 && self.equipment.currentLevel < equipment.changeVisual2 {
                
                characterAsset = "Dev_step_02"
            }
            else if self.equipment.currentLevel >= equipment.changeVisual2 {
                characterAsset = "Dev_step_03"
            }
            else {
                characterAsset = "Dev_step_01-1"
                
            }
        }
        else if character == "whiteDesigner" {
            anchorPoint = CGPoint(x: 0.564, y: 0.578 )
            if self.equipment.currentLevel >= equipment.changeVisual1 && self.equipment.currentLevel < equipment.changeVisual2 {
                
                characterAsset = "Designer_step_02"
            }
            else if self.equipment.currentLevel >= equipment.changeVisual2 {
                characterAsset = "Designer_step_03"
            }
            else {
                characterAsset = "Designer_step_01"
                
            }
        }
        else if character == "blackDev" {
            anchorPoint = CGPoint(x: 0.458, y: 0.5)
            if self.equipment.currentLevel >= equipment.changeVisual1 && self.equipment.currentLevel < equipment.changeVisual2 {
                
                characterAsset = "blackDev_02"
            }
            else if self.equipment.currentLevel >= equipment.changeVisual2 {
                characterAsset = "blackDev_03"
            }
            else {
                characterAsset = "blackDev_01"
                
            }
        }

        
        let desk = SKSpriteNode(imageNamed: characterAsset)
        

        //anchorPoint setter for dev is at position x: 0.458 , y: 0.5
        desk.anchorPoint = anchorPoint
        desk.zPosition = 2
        desk.name = "desk"
        
        return desk
    }()
    
    init(character: String, x: CGFloat, y: CGFloat, perSec: Decimal, increase: Decimal, id: Int, basePrice: Decimal, observer: MainCurrency, equipmentLevel: Int, equipmentMultiply: Decimal, equipmentPriceMultiplier: Decimal, currentLevel: Int, equipmentCurrentPrice: Decimal, currentPrice: Decimal) {
        self.character = character
        self.perSec = perSec
        self.multipliers = [Multiplier]()
        self.id = id
        self.currentPrice = currentPrice
        self.basePrice = basePrice
        self.currentLevel = currentLevel
        self.increase = increase
        self.observer = observer
        equipment = Equipment(id: self.id, basePrice: self.basePrice * 0.2, observer: self.observer, currentPrice: equipmentCurrentPrice, currentLevel: equipmentLevel, multiply: equipmentMultiply, priceMultiplier: equipmentPriceMultiplier)
        super.init()
        self.addMultiplier(m: equipment)
        self.isUserInteractionEnabled = true
        self.addChild(desk)
        self.desk.position = CGPoint(x: x, y: y)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        
        
        if node.name == "desk" {
            
            SoundController.selectSound(parentNode: desk)
            
            delegate?.didTapDev(character: self)
        }
    }
    
}
