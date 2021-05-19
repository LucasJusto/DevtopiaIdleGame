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
        
        leftWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        
        midWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        
        rightWhiteBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        
        
        coinImageLeft = SKSpriteNode(imageNamed: "DevCoin")
        coinImageLeft.size = CGSize(width: leftWhiteBar.size.height * 0.8, height: leftWhiteBar.size.height * 0.8)
        dollarImage = SKSpriteNode(imageNamed: "Money")
        dollarImage.size = CGSize(width: midWhiteBar.size.height * 0.8, height: midWhiteBar.size.height * 0.8)
        coinImageRight = SKSpriteNode(imageNamed: "DevCoin")
        coinImageRight.size = CGSize(width: rightWhiteBar.size.height * 0.8, height: rightWhiteBar.size.height * 0.8)
        
        let leftPadding: CGFloat = 5
        self.mainCurrency = mainCurrency
        
        //main currency per sec
        leftLabel = SKLabelNode(fontNamed: "Montserrat-Bold")
        leftLabel.text = "\(mainCurrency.decimalToString(value: mainCurrency.getDevCoinsPerSec()))/s"
        leftLabel.fontColor = .black
        coinImageLeft.position = CGPoint(x: -leftWhiteBar.size.width/2 + leftPadding + coinImageLeft.size.width/2, y: 0)
        leftLabel.position = CGPoint(x: coinImageLeft.position.x + coinImageLeft.size.width/2, y: 0)
        leftLabel.fontSize = leftWhiteBar.size.height * 0.5
        leftLabel.horizontalAlignmentMode = .left
        leftLabel.verticalAlignmentMode = .center
        
        //premium currency
        
        midLabel = SKLabelNode(fontNamed: "Montserrat-Bold")
        midLabel.text = "0"
        midLabel.fontColor = .black
        dollarImage.position = CGPoint(x: -midWhiteBar.size.width/2 + leftPadding + dollarImage.size.width/2, y: 0)
        midLabel.position = CGPoint(x: dollarImage.position.x + dollarImage.size.width/2, y: 0)
        midLabel.fontSize = midWhiteBar.size.height * 0.5
        midLabel.horizontalAlignmentMode = .left
        midLabel.verticalAlignmentMode = .center
        
        //main currency
        rightLabel = SKLabelNode(fontNamed: "Montserrat-Bold")
        rightLabel.text = mainCurrency.decimalToString(value: mainCurrency.getDevCoins())
        rightLabel.fontColor = .black
        coinImageRight.position = CGPoint(x: -rightWhiteBar.size.width/2 + leftPadding + coinImageRight.size.width/2, y: 0)
        rightLabel.position = CGPoint(x: coinImageRight.position.x + coinImageRight.size.width/2, y: 0)
        rightLabel.fontSize = rightWhiteBar.size.height * 0.5
        rightLabel.horizontalAlignmentMode = .left
        rightLabel.verticalAlignmentMode = .center
        
        
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
        leftLabel.text = "\(mainCurrency.decimalToString(value: mainCurrency.getDevCoinsPerSec()))/s"
        
        midLabel.text = "0"
        
        rightLabel.text = mainCurrency.decimalToString(value: mainCurrency.getDevCoins())
    }
    
}
