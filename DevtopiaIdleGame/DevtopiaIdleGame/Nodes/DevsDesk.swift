//
//  DevsDesk.swift
//  DevtopiaIdleGame
//
//  Created by Enzo Degrazia on 05/05/21.
//

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
    
    
    private lazy var desk: SKSpriteNode = {

        let desk = SKSpriteNode(imageNamed: "Dev_step_01-1")
        
        //setter da anchorPoint do dev para a posição x: 0.458 , y: 0.5
        desk.anchorPoint = CGPoint(x: 0.458, y: 0.5)
        desk.zPosition = 1
        desk.name = "desk"
        //desk.size = CGSize(width: 500, height: 500
        return desk
    }()
    
    init(x: Double = 0, y: Double = 844.5, perSec: Decimal, increase: Decimal, id: Int, basePrice: Decimal, observer: MainCurrency) {
        self.perSec = perSec
        self.multipliers = [Multiplier]()
        self.id = id
        self.currentPrice = basePrice
        self.basePrice = basePrice
        self.currentLevel = 1
        self.increase = increase
        self.observer = observer
        super.init()
        let multiplier = Equipment(id: 0, basePrice: 750, observer: observer)
        self.addMultiplier(m: multiplier)
        isUserInteractionEnabled = true
        addChild(desk)
        desk.position = CGPoint(x: x, y: y)
        self.observer.addGenerator(generator: self)
        self.observer.addMultiplier(multiplier: multiplier)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = self.atPoint(location ?? .zero)
        
        if node.name == "desk" {
            delegate?.didTapDev(character: self)
        }
    }
    
}
