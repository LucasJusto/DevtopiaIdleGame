//
//  KeyboardCoin.swift
//  DevTopia
//
//  Created by Enzo Degrazia on 19/05/21.
//

import Foundation
import SpriteKit

class KeyboardCoin: SKSpriteNode {
    
    var mainCurrency: MainCurrency
    var popUpBar: SKSpriteNode
    var popUpLabel: SKLabelNode
    let coinImage: SKSpriteNode
    
    init(mainCurrency: MainCurrency) {
        
       popUpBar = SKSpriteNode(texture: nil, color: .white, size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.03))
        
        coinImage = SKSpriteNode(imageNamed: "DevCoin")
        coinImage.size = CGSize(width: popUpBar.size.height * 0.8, height: popUpBar.size.height * 0.8)
        
        self.mainCurrency = mainCurrency

        popUpLabel = SKLabelNode(fontNamed: "Montserrat-Bold")
        let valueEarned = mainCurrency.getDevCoinsPerSec() * 0.2
        popUpLabel.text = "+\(mainCurrency.decimalToString(value: valueEarned))"
        
        popUpLabel.fontColor = .black
        popUpLabel.fontSize = popUpBar.size.height * 0.5
        //coinImage.position = CGPoint(x: -popUpBar.size.width/2 + padding + coinImage.size.width/2, y: 0)
        popUpBar.size = CGSize(width: coinImage.size.width + popUpLabel.frame.width + (UIScreen.main.bounds.width * 0.035), height: UIScreen.main.bounds.height * 0.03)
        let spaceLeftPercentage = 1-((coinImage.size.width + popUpLabel.frame.width)/popUpBar.size.width)
        coinImage.position = CGPoint(x: (popUpBar.size.width * -0.5 + coinImage.size.width/2) + (spaceLeftPercentage/2 * popUpBar.size.width), y: 0)
        popUpLabel.position = CGPoint(x: coinImage.position.x + coinImage.size.width/2, y: 0)
       
        popUpLabel.horizontalAlignmentMode = .left
        popUpLabel.verticalAlignmentMode = .center
        
        super.init(texture: nil, color: UIColor(named: "auxColor")!, size: CGSize(width: UIScreen.main.bounds.width * 0.20, height: UIScreen.main.bounds.height * 0.03))
//        self.position = CGPoint(x: 0, y: UIScreen.main.bounds.height/11.35 - self.frame.height/2)
        self.zPosition = -1
//        popUpBar.position = CGPoint(x: 0, y: -self.frame.height/2)
        self.addChild(popUpBar)
        popUpBar.addChild(coinImage)
        popUpBar.addChild(popUpLabel)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//value: mainCurrency.getDevCoinsPerSec() * 0.2




