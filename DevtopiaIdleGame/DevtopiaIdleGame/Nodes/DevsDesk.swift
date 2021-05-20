import Foundation
import SpriteKit

protocol DevDelegate: AnyObject {
    func didTapDev(character: Generator)
}

class DevsDesk: SKNode, Generator{
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
        
        let desk = SKSpriteNode(imageNamed: "Dev_step_01-1")
        if self.equipment.currentLevel >= equipment.changeVisual1 && self.equipment.currentLevel < equipment.changeVisual2 {
            desk.texture = SKTexture(imageNamed: "Dev_step_02")
        }
        else if self.equipment.currentLevel >= equipment.changeVisual2 {
            desk.texture = SKTexture(imageNamed: "Dev_step_03")
        }
        //anchorPoint setter for dev is at position x: 0.458 , y: 0.5
        desk.anchorPoint = CGPoint(x: 0.458, y: 0.5)
        desk.zPosition = 1
        desk.name = "desk"
        
        return desk
    }()
    
    init(x: CGFloat, y: CGFloat, perSec: Decimal, increase: Decimal, id: Int, basePrice: Decimal, observer: MainCurrency, equipmentLevel: Int, equipmentMultiply: Decimal, equipmentPriceMultiplier: Decimal, currentLevel: Int, equipmentCurrentPrice: Decimal, currentPrice: Decimal) {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        
        
        if node.name == "desk" {
           
            SoundController.selectSound(parentNode: desk)
            
            delegate?.didTapDev(character: self)
        }
    }
    
}
