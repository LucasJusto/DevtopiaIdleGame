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
    var leftLabel: SKLabelNode
    var midLabel: SKLabelNode
    var rightLabel: SKLabelNode
    let dollarImage: SKSpriteNode
    let coinImageLeft: SKSpriteNode
    let coinImageRight: SKSpriteNode
    
    public init(mainCurrency: MainCurrency){
        self.mainCurrency = mainCurrency
        //main currency per sec
        leftWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        leftLabel = SKLabelNode(fontNamed: "Montserrat-Bold")
        leftLabel.text = "\(mainCurrency.getDevCoinsPerSec())/s"
        leftLabel.fontColor = .black
        leftLabel.position = CGPoint(x: 0, y: -(leftLabel.frame.height/2) + 10)
        leftLabel.fontSize = 15
        
        //premium currency
        midWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        midLabel = SKLabelNode(fontNamed: "Montserrat-Bold")
        midLabel.text = "0"
        midLabel.fontColor = .black
        midLabel.position = CGPoint(x: 0, y: -(midLabel.frame.height/2) + 7)
        midLabel.fontSize = 15
        
        //main currency
        rightWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        rightLabel = SKLabelNode(fontNamed: "Montserrat-Bold")
        rightLabel.text = "\(mainCurrency.getDevCoins())"
        rightLabel.fontColor = .black
        rightLabel.position = CGPoint(x: 0, y: -(rightLabel.frame.height/2) + 7)
        rightLabel.fontSize = 15
        
        let leftPadding: CGFloat = 5
        dollarImage = SKSpriteNode(imageNamed: "Money")
        dollarImage.size = CGSize(width: 20, height: 20)
        dollarImage.position = CGPoint(x: -midWhiteBar.size.width/2 + leftPadding + dollarImage.size.width/2, y: 0)
        coinImageLeft = SKSpriteNode(imageNamed: "DevCoin")
        coinImageLeft.size = CGSize(width: 15, height: 15)
        coinImageLeft.position = CGPoint(x: -leftWhiteBar.size.width/2 + leftPadding + coinImageLeft.size.width/2, y: 0)
        coinImageRight = SKSpriteNode(imageNamed: "DevCoin")
        coinImageRight.size = CGSize(width: 15, height: 15)
        coinImageRight.position = CGPoint(x: -rightWhiteBar.size.width/2 + leftPadding + coinImageRight.size.width/2, y: 0)
        
        super.init(texture: nil, color: UIColor(named: "greenTab")!, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1))
        self.position = CGPoint(x: 0, y: UIScreen.main.bounds.height/2 - self.frame.height/2)
        self.zPosition = .infinity
        leftWhiteBar.position = CGPoint(x: self.frame.width * -0.3, y: -self.frame.height/2)
        midWhiteBar.position = CGPoint(x: 0, y: -self.frame.height/2)
        rightWhiteBar.position = CGPoint(x: self.frame.width * 0.3, y: -self.frame.height/2)
        updateLabels()
        self.addChild(leftWhiteBar)
        leftWhiteBar.addChild(coinImageLeft)
        leftWhiteBar.addChild(leftLabel)
        self.addChild(midWhiteBar)
        midWhiteBar.addChild(dollarImage)
        midWhiteBar.addChild(midLabel)
        self.addChild(rightWhiteBar)
        rightWhiteBar.addChild(coinImageRight)
        rightWhiteBar.addChild(rightLabel)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLabels(){
        leftLabel.text = "\(mainCurrency.getDevCoinsPerSec())/s"
        
        midLabel.text = "0"
        
        rightLabel.text = "\(mainCurrency.getDevCoins())"
    }
    
}
