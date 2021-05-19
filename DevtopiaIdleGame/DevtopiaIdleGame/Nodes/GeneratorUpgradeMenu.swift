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
    var devPerSecNow: SKLabelNode
    var devPerSecAfter: SKLabelNode
    var equipmentPerSecNow: SKLabelNode
    var equipmentPerSecAfter: SKLabelNode
    var equipment: Equipment?
    var devImage: SKSpriteNode
    
    public init(generator: Generator){
        self.generator = generator
        self.coinImage1 = SKSpriteNode(imageNamed: "DevCoin")
        self.levelLabel = SKLabelNode(text: "Level")
        self.developerLevelLabel = SKLabelNode(text: "Developer: \(generator.currentLevel)")
        self.valueProducedLabel = SKLabelNode(text: "Value produced:")
        self.generatorPerSecLabel = SKLabelNode(text: "\(generator.observer.decimalToString(value:(generator.getCurrencyPerSec())))/s")
        self.equipment = (self.generator as! DevsDesk).equipment
        self.devPerSecNow = SKLabelNode(text: "\((generator.observer.decimalToString(value: self.generator.getCurrencyPerSec())))/s")
        self.devPerSecNow.horizontalAlignmentMode = .left
        self.devPerSecAfter = SKLabelNode(text: "\(generator.observer.decimalToString(value:(self.generator.getCurrencyPerSec() + self.generator.getIncrease())))/s")
        self.devPerSecAfter.horizontalAlignmentMode = .left
        self.equipmentPerSecNow = SKLabelNode(text: "\(generator.observer.decimalToString(value: (1 + self.equipment!.multiply)*100))%")
        self.equipmentPerSecNow.horizontalAlignmentMode = .left
        self.equipmentPerSecAfter = SKLabelNode(text: "\(generator.observer.decimalToString(value: ((1 + equipment!.multiply + equipment!.increase)*100)))%")
        self.equipmentPerSecAfter.horizontalAlignmentMode = .left
        self.equipmentLevelLabel = SKLabelNode(text: "Work Station: \(equipment!.currentLevel)")
        devImage = SKSpriteNode(imageNamed: "Dev_step_01-1")
        devImage.texture = (generator as! DevsDesk).desk.texture
        super.init(texture: nil, color: UIColor(named: "white")!, size: CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.6))
        self.zPosition = 100
        self.name = "GeneratorUpgradeMenu"
        self.isUserInteractionEnabled = true
        
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
        devImage.size = CGSize(width: greenRectangle.size.width * 0.6, height: greenRectangle.size.height * 0.85)
        devImage.position = CGPoint(x: greenRectangle.size.width * -0.22, y: 0)
        greenRectangle.addChild(devImage)
        
        let closeButton: CloseButton = CloseButton(menu: self, width: greenRectangle.size.width * 0.1, height: greenRectangle.size.width * 0.1)
        closeButton.position = CGPoint(x: greenRectangle.size.width * 0.5 - closeButton.size.width/2 - self.size.width * 0.02, y: greenRectangle.size.height * 0.5 - closeButton.size.height/2 - self.size.width * 0.02)
        
        greenRectangle.addChild(closeButton)
        
        var verticalPadding: CGFloat = 0
        
        levelLabel.horizontalAlignmentMode = .left
        levelLabel.fontSize = greenRectangle.size.height * 0.13
        levelLabel.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        levelLabel.fontName = "Montserrat-Bold"
        greenRectangle.addChild(levelLabel)
        
        developerLevelLabel.horizontalAlignmentMode = .left
        developerLevelLabel.fontSize = levelLabel.fontSize/2
        verticalPadding += levelLabel.fontSize
        developerLevelLabel.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        developerLevelLabel.fontName = "Montserrat-SemiBold"
        greenRectangle.addChild(developerLevelLabel)
        
        equipmentLevelLabel.horizontalAlignmentMode = .left
        equipmentLevelLabel.fontSize = levelLabel.fontSize/2
        verticalPadding += developerLevelLabel.fontSize * 2
        equipmentLevelLabel.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        equipmentLevelLabel.fontName = "Montserrat-SemiBold"
        greenRectangle.addChild(equipmentLevelLabel)
        
        valueProducedLabel.horizontalAlignmentMode = .left
        valueProducedLabel.fontSize = levelLabel.fontSize/2
        verticalPadding += equipmentLevelLabel.fontSize * 3
        valueProducedLabel.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        valueProducedLabel.fontName = "Montserrat-Regular"
        greenRectangle.addChild(valueProducedLabel)
        
        generatorPerSecLabel.horizontalAlignmentMode = .left
        generatorPerSecLabel.fontSize = levelLabel.fontSize/2
        verticalPadding += valueProducedLabel.fontSize * 2
        generatorPerSecLabel.position = CGPoint(x: greenRectangle.size.width/20 + generatorPerSecLabel.fontSize, y: greenRectangle.size.height/4 - verticalPadding + 1)
        generatorPerSecLabel.fontName = "Montserrat-Bold"
        greenRectangle.addChild(generatorPerSecLabel)
        
        coinImage1.size = CGSize(width: generatorPerSecLabel.fontSize, height: generatorPerSecLabel.fontSize)
        coinImage1.anchorPoint = CGPoint(x: 0, y: 0)
        coinImage1.position = CGPoint(x: greenRectangle.size.width/20, y: greenRectangle.size.height/4 - verticalPadding)
        greenRectangle.addChild(coinImage1)
        
        return greenRectangle
    }
    
    func createGrayRectangle() -> SKSpriteNode {
        let grayRectangle: SKSpriteNode = SKSpriteNode(texture: nil, color: UIColor(named: "gray")!, size: CGSize(width: self.size.width * 0.95, height: self.size.height * 0.475))
        let y: CGFloat = -self.size.height/2 + grayRectangle.size.height/2 + self.size.width * 0.025
        grayRectangle.position = CGPoint(x: 0, y: y)
        
        //developer skills black rectangle
        let developerRectangle: SKSpriteNode = SKSpriteNode(color: UIColor(named: "black")!, size: CGSize(width: grayRectangle.size.width * 0.9, height: grayRectangle.size.height * 0.1))
        developerRectangle.position = CGPoint(x: 0, y: grayRectangle.size.height * 0.4 - developerRectangle.size.height/2)
        let developerLabel: SKLabelNode = SKLabelNode(text: "Developer Skills")
        developerLabel.horizontalAlignmentMode = .left
        developerLabel.color = UIColor(named: "white")
        developerLabel.fontSize = developerRectangle.size.height * 0.7
        developerLabel.fontName = "Montserrat-Bold"
        developerLabel.position = CGPoint(x: -developerRectangle.size.width * 0.475, y: -developerLabel.fontSize/2)
        developerRectangle.addChild(developerLabel)
        grayRectangle.addChild(developerRectangle)
        
        //developer upgrade button
        let developerUpgradeButton: UpgradeButton = UpgradeButton(menu: self, type: ButtonType.developer)
        developerUpgradeButton.position = CGPoint(x: grayRectangle.size.width * 0.18, y: grayRectangle.size.height * 0.13)
        grayRectangle.addChild(developerUpgradeButton)
        
        let devNowLabel: SKLabelNode = SKLabelNode(text: "Now")
        devNowLabel.fontSize = developerLabel.fontSize * 0.7
        devNowLabel.fontName = "Montserrat-Regular"
        devNowLabel.fontColor = UIColor(named: "black")
        devNowLabel.position = CGPoint(x: -grayRectangle.size.width * 0.4, y: developerUpgradeButton.position.y + developerUpgradeButton.size.height/2 - devNowLabel.fontSize)
        devNowLabel.horizontalAlignmentMode = .left
        let devAfterLabel: SKLabelNode = SKLabelNode(text: "After Upgrade")
        devAfterLabel.fontSize = developerLabel.fontSize * 0.85
        devAfterLabel.fontName = "Montserrat-Bold"
        devAfterLabel.fontColor = UIColor(named: "black")
        devAfterLabel.position = CGPoint(x: -grayRectangle.size.width * 0.4, y: devNowLabel.position.y - devAfterLabel.fontSize/2 - grayRectangle.size.height * 0.08)
        devAfterLabel.horizontalAlignmentMode = .left
        
        let coinImageDevNow: SKSpriteNode = SKSpriteNode(imageNamed: "DevCoin")
        coinImageDevNow.size = CGSize(width: devNowLabel.fontSize, height: devNowLabel.fontSize)
        coinImageDevNow.position = CGPoint(x: devNowLabel.position.x + devNowLabel.frame.width + grayRectangle.size.width * 0.03, y: devNowLabel.position.y + coinImageDevNow.size.height/2)
        devPerSecNow.fontSize = coinImageDevNow.size.height
        devPerSecNow.fontName = "Montserrat-Regular"
        devPerSecNow.fontColor = UIColor(named: "black")
        devPerSecNow.position = CGPoint(x: coinImageDevNow.position.x + coinImageDevNow.size.width/2, y: coinImageDevNow.position.y - devPerSecNow.fontSize/2)
        let coinImageDevAfter: SKSpriteNode = SKSpriteNode(imageNamed: "DevCoin")
        coinImageDevAfter.size = CGSize(width: devAfterLabel.fontSize, height: devAfterLabel.fontSize)
        coinImageDevAfter.position = CGPoint(x: devAfterLabel.position.x + coinImageDevAfter.size.width/2, y: devAfterLabel.position.y - coinImageDevAfter.size.height)
        devPerSecAfter.fontSize = coinImageDevAfter.size.height
        devPerSecAfter.fontName = "Montserrat-SemiBold"
        devPerSecAfter.fontColor = UIColor(named: "black")
        devPerSecAfter.position = CGPoint(x: coinImageDevAfter.position.x + coinImageDevAfter.size.width/2, y: coinImageDevAfter.position.y - devPerSecAfter.fontSize/2)
        
        grayRectangle.addChild(devNowLabel)
        grayRectangle.addChild(coinImageDevNow)
        grayRectangle.addChild(devPerSecNow)
        grayRectangle.addChild(devAfterLabel)
        grayRectangle.addChild(coinImageDevAfter)
        grayRectangle.addChild(devPerSecAfter)
        
        //work station black rectangle
        let equipmentRectangle: SKSpriteNode = SKSpriteNode(color: UIColor(named: "black")!, size: CGSize(width: grayRectangle.size.width * 0.9, height: grayRectangle.size.height * 0.1))
        equipmentRectangle.position = CGPoint(x: 0, y: -grayRectangle.size.height * 0.05 - equipmentRectangle.size.height/2)
        let equipmentLabel: SKLabelNode = SKLabelNode(text: "Work Station")
        equipmentLabel.horizontalAlignmentMode = .left
        equipmentLabel.color = UIColor(named: "white")
        equipmentLabel.fontSize = equipmentRectangle.size.height * 0.7
        equipmentLabel.fontName = "Montserrat-Bold"
        equipmentLabel.position = CGPoint(x: -equipmentRectangle.size.width * 0.475, y: -equipmentLabel.fontSize/2)
        equipmentRectangle.addChild(equipmentLabel)
        grayRectangle.addChild(equipmentRectangle)
        
        //equipment upgrade button
        let equipmentUpgradeButton: UpgradeButton = UpgradeButton(menu: self, type: ButtonType.equipment)
        equipmentUpgradeButton.position = CGPoint(x: grayRectangle.size.width * 0.18, y: grayRectangle.size.height * -0.32)
        grayRectangle.addChild(equipmentUpgradeButton)
        
        let equipmentNowLabel: SKLabelNode = SKLabelNode(text: "Now")
        equipmentNowLabel.fontSize = equipmentLabel.fontSize * 0.7
        equipmentNowLabel.fontName = "Montserrat-Regular"
        equipmentNowLabel.fontColor = UIColor(named: "black")
        equipmentNowLabel.position = CGPoint(x: -grayRectangle.size.width * 0.4, y: equipmentUpgradeButton.position.y + equipmentUpgradeButton.size.height/2 - equipmentNowLabel.fontSize)
        equipmentNowLabel.horizontalAlignmentMode = .left
        let equipmentAfterLabel: SKLabelNode = SKLabelNode(text: "After Upgrade")
        equipmentAfterLabel.fontSize = equipmentLabel.fontSize * 0.85
        equipmentAfterLabel.fontName = "Montserrat-Bold"
        equipmentAfterLabel.fontColor = UIColor(named: "black")
        equipmentAfterLabel.position = CGPoint(x: -grayRectangle.size.width * 0.4, y: equipmentNowLabel.position.y - equipmentAfterLabel.fontSize - 10)
        equipmentAfterLabel.horizontalAlignmentMode = .left
        
        let coinImageEquipmentNow: SKSpriteNode = SKSpriteNode(imageNamed: "DevCoin")
        coinImageEquipmentNow.size = CGSize(width: equipmentNowLabel.fontSize, height: equipmentNowLabel.fontSize)
        coinImageEquipmentNow.position = CGPoint(x: equipmentNowLabel.position.x + equipmentNowLabel.frame.width + grayRectangle.size.width * 0.03, y: equipmentNowLabel.position.y + coinImageEquipmentNow.size.height/2)
        equipmentPerSecNow.fontSize = equipmentNowLabel.fontSize
        equipmentPerSecNow.fontName = "Montserrat-Regular"
        equipmentPerSecNow.fontColor = UIColor(named: "black")
        equipmentPerSecNow.position = CGPoint(x: coinImageEquipmentNow.position.x + coinImageEquipmentNow.size.width/2, y: coinImageEquipmentNow.position.y - equipmentPerSecNow.fontSize/2)
    
        let coinImageEquipmentAfter: SKSpriteNode = SKSpriteNode(imageNamed: "DevCoin")
        coinImageEquipmentAfter.size = CGSize(width: equipmentAfterLabel.fontSize, height: equipmentAfterLabel.fontSize)
        coinImageEquipmentAfter.position = CGPoint(x: equipmentAfterLabel.position.x + coinImageEquipmentAfter.size.width/2 , y: equipmentAfterLabel.position.y - coinImageEquipmentAfter.size.height)
        equipmentPerSecAfter.fontSize = coinImageEquipmentAfter.size.height
        equipmentPerSecAfter.fontName = "Montserrat-SemiBold"
        equipmentPerSecAfter.fontColor = UIColor(named: "black")
        equipmentPerSecAfter.position = CGPoint(x: coinImageEquipmentAfter.position.x + coinImageEquipmentAfter.size.width/2, y: coinImageEquipmentAfter.position.y - equipmentPerSecAfter.fontSize/2)
        
        grayRectangle.addChild(equipmentNowLabel)
        grayRectangle.addChild(coinImageEquipmentNow)
        grayRectangle.addChild(equipmentPerSecNow)
        grayRectangle.addChild(equipmentAfterLabel)
        grayRectangle.addChild(coinImageEquipmentAfter)
        grayRectangle.addChild(equipmentPerSecAfter)
        
        return grayRectangle
    }
    
    func updateNumbers() {
        developerLevelLabel.text = "Developer: \(generator.currentLevel)"
        equipmentLevelLabel.text = "Work Station: \(equipment!.currentLevel)"
        generatorPerSecLabel.text = "\(generator.observer.decimalToString(value:(generator.getCurrencyPerSec())))/s"
        devPerSecNow.text = "\((generator.observer.decimalToString(value: self.generator.getCurrencyPerSec())))/s"
        devPerSecAfter.text = "\(generator.observer.decimalToString(value:(self.generator.getCurrencyPerSec() + self.generator.getIncrease())))/s"
        equipmentPerSecNow.text = "\(generator.observer.decimalToString(value: (1 + self.equipment!.multiply)*100))%"
        equipmentPerSecAfter.text = "\(generator.observer.decimalToString(value: ((1 + equipment!.multiply + equipment!.increase)*100)))%"
        equipmentLevelLabel.text = "Work Station: \(equipment!.currentLevel)"
    }
}
