//
//  GeneratorUpgradeMenu.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 11/05/21.
//

import Foundation
import SpriteKit

class GeneratorUpgradeMenu: SKSpriteNode {
    var generator: Generator
    var coinImage1: SKSpriteNode
    var levelLabel: SKLabelNode
    var developerLevelLabel: SKLabelNode
    var equipmentLevelLabel: SKLabelNode
    var valueProducedLabel: SKLabelNode
    var generatorPerSecLabel: SKLabelNode
    var equipment: Equipment?
    
    public init(generator: Generator){
        self.generator = generator
        self.coinImage1 = SKSpriteNode(imageNamed: "DevCoin")
        self.levelLabel = SKLabelNode(text: "Level")
        self.developerLevelLabel = SKLabelNode(text: "Developer: \(generator.currentLevel)")
        self.valueProducedLabel = SKLabelNode(text: "Value produced:")
        self.generatorPerSecLabel = SKLabelNode(text: "\(generator.getCurrencyPerSec())/s")
        self.equipment = Equipment(id: 0, basePrice: 0, observer: MainCurrency())
        for m in generator.multipliers {
            if m.name == "desk" {
                equipment = (m as! Equipment)
            }
        }
        self.equipmentLevelLabel = SKLabelNode(text: "Work Station: \(equipment!.currentLevel)")
        super.init(texture: nil, color: UIColor(named: "white")!, size: CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.6))
        self.zPosition = .infinity
        self.name = "GeneratorUpgradeMenu"
        
        //green rectangle
        self.addChild(createGreenRectangle())
        self.addChild(createGrayRectangle())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createGreenRectangle() -> SKSpriteNode {
        let greenRectangle: SKSpriteNode = SKSpriteNode(texture: nil, color: UIColor(named: "greenTab")!, size: CGSize(width: self.size.width * 0.95, height: self.size.height * 0.475))
        greenRectangle.position = CGPoint(x: 0, y: self.size.height/2 - greenRectangle.size.height/2 - self.size.width * 0.025)
        
        //adding dev's image
        let devImage: SKSpriteNode = SKSpriteNode(imageNamed: "Dev_step_01-1")
        devImage.size = CGSize(width: greenRectangle.size.width * 0.6, height: greenRectangle.size.height * 0.85)
        devImage.position = CGPoint(x: greenRectangle.size.width * -0.2, y: 0)
        greenRectangle.addChild(devImage)
        
        var verticalPadding: CGFloat = 0
        
        levelLabel.horizontalAlignmentMode = .left
        levelLabel.fontSize = 25
        levelLabel.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        levelLabel.fontName = "Montserrat-Bold"
        greenRectangle.addChild(levelLabel)
        
        developerLevelLabel.horizontalAlignmentMode = .left
        developerLevelLabel.fontSize = 13
        verticalPadding += levelLabel.fontSize+5
        developerLevelLabel.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        developerLevelLabel.fontName = "Montserrat-SemiBold"
        greenRectangle.addChild(developerLevelLabel)
        
        equipmentLevelLabel.horizontalAlignmentMode = .left
        equipmentLevelLabel.fontSize = 13
        verticalPadding += developerLevelLabel.fontSize + 5
        equipmentLevelLabel.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        equipmentLevelLabel.fontName = "Montserrat-SemiBold"
        greenRectangle.addChild(equipmentLevelLabel)
        
        valueProducedLabel.horizontalAlignmentMode = .left
        valueProducedLabel.fontSize = 18
        verticalPadding += equipmentLevelLabel.fontSize + valueProducedLabel.fontSize + 5
        valueProducedLabel.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        valueProducedLabel.fontName = "Montserrat-Regular"
        greenRectangle.addChild(valueProducedLabel)
        
        generatorPerSecLabel.horizontalAlignmentMode = .left
        generatorPerSecLabel.fontSize = 20
        verticalPadding += valueProducedLabel.fontSize + equipmentLevelLabel.fontSize + 5
        generatorPerSecLabel.position = CGPoint(x: greenRectangle.size.width/20 + 25, y: greenRectangle.size.height/4 - verticalPadding + 2)
        generatorPerSecLabel.fontName = "Montserrat-Bold"
        greenRectangle.addChild(generatorPerSecLabel)
        
        coinImage1.size = CGSize(width: 20, height: 20)
        coinImage1.anchorPoint = CGPoint(x: 0, y: 0)
        coinImage1.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        greenRectangle.addChild(coinImage1)
        
        return greenRectangle
    }
    
    func createGrayRectangle() -> SKSpriteNode {
        let grayRectangle: SKSpriteNode = SKSpriteNode(texture: nil, color: UIColor(named: "gray")!, size: CGSize(width: self.size.width * 0.95, height: self.size.height * 0.475))
        let y: CGFloat = -self.size.height/2 + grayRectangle.size.height/2 + self.size.width * 0.025 //if I throw it directly at the CGPoint, swift says it is too long. Why SWIFT? WHYYYY??
        grayRectangle.position = CGPoint(x: 0, y: y)
        return grayRectangle
    }
    
    func updateNumbers() {
        developerLevelLabel.text = "Developer: \(generator.currentLevel)"
        equipmentLevelLabel.text = "Work Station: \(equipment!.currentLevel)"
        generatorPerSecLabel.text = "\(generator.getCurrencyPerSec())/s"
    }
}
