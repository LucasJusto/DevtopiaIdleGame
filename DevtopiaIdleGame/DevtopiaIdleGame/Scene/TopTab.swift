//
//  TopTab.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 07/05/21.
//

import Foundation
import SpriteKit

class TopTab: SKSpriteNode {
    var mainCurrency: MainCurrency
    var leftWhiteBar: SKSpriteNode
    var midWhiteBar: SKSpriteNode
    var rightWhiteBar: SKSpriteNode
    
    public init(){
        mainCurrency = MainCurrency()
        //main currency per sec
        leftWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        
        
        //premium currency
        midWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        
        
        //main currency
        rightWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        
        super.init(texture: nil, color: UIColor(named: "greenTab")!, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1))
        self.position = CGPoint(x: 0, y: UIScreen.main.bounds.height/2 - self.frame.height/2)
        self.zPosition = .infinity
        leftWhiteBar.position = CGPoint(x: self.frame.width * -0.3, y: -self.frame.height/2)
        midWhiteBar.position = CGPoint(x: 0, y: -self.frame.height/2)
        rightWhiteBar.position = CGPoint(x: self.frame.width * 0.3, y: -self.frame.height/2)
        updateLabels()
        self.addChild(leftWhiteBar)
        self.addChild(midWhiteBar)
        self.addChild(rightWhiteBar)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLabels(){
        let leftLabel = SKLabelNode(text: "\(mainCurrency.getDevCoinsPerSec())/s")
        leftLabel.fontColor = .black
        leftLabel.position = CGPoint(x: 0, y: -(leftLabel.frame.height/2) + 7)
        leftLabel.fontName = "Montserrat-Bold"
        leftLabel.fontSize = 15
        
        leftWhiteBar.addChild(leftLabel)
        
        let midLabel = SKLabelNode(text: "0")
        midLabel.fontColor = .black
        midLabel.position = CGPoint(x: 0, y: -(midLabel.frame.height/2) + 7)
        midLabel.fontSize = 15
        midWhiteBar.addChild(midLabel)
        
        let rightLabel = SKLabelNode(text: "\(mainCurrency.getDevCoins())")
        rightLabel.fontColor = .black
        rightLabel.position = CGPoint(x: 0, y: -(rightLabel.frame.height/2) + 7)
        rightLabel.fontSize = 15
        rightWhiteBar.addChild(rightLabel)
    }
    
}
