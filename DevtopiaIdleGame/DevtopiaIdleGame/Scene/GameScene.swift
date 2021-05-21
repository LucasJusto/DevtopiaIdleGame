import SpriteKit
import Foundation

class GameScene: SKScene {
    
    var mainCurrency: MainCurrency = MainCurrency()
    var topTab: TopTab!
    var keyboard: KeyboardButton!
    lazy var perSecIncrement: SKAction = {
        let incrementAction = SKAction.run {
            self.mainCurrency.updateDevCoins()
        }
        let delay = SKAction.wait(forDuration: 1)
        
        let sequence = SKAction.sequence([delay, incrementAction])
        
        let actionForever = SKAction.repeatForever(sequence)
        
        return actionForever
    }()
    var save1: GameSave = GameSave()
    
    // MARK: Properties
    // Background properties
    private lazy var background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "Piso")
        // Background position setter x: 0.5 , y: 0.5
        background.position = CGPoint(x: 0.5,y: 0.5)
        // Background anchorPoint setter x: 0.5 , y: 0.5
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 0
        
        return background
    }()
    
    
    // Game camera
    private lazy var cameraNode: Camera = {
        let cameraNode = Camera(sceneView: self.view!, scenario: background)
        cameraNode.position = CGPoint(x:UIScreen.main.bounds.width / 50, y: UIScreen.main.bounds.height / 2)
        cameraNode.applyZoomScale(scale: 0.5)
        topTab = TopTab(mainCurrency: mainCurrency)
        cameraNode.addChild(topTab)
        keyboard = KeyboardButton(mainCurrency: mainCurrency)
        cameraNode.addChild(keyboard)
        return cameraNode
    }()
    
    override func didMove(to view: SKView) {
        
        // GameScene anchorPoint setter x: 0 , y: 0
        anchorPoint = CGPoint(x: 0, y: 0)
        // GameScene size setter to scenario size
        self.size = background.size
        
        // Attributes GameScene camera to customized camera
        camera = cameraNode
        
        // Adds camera to background as child
        addChild(background)
        
        if let _ = save1.userDefaults.value(forKey: "devCoins") {
            save1.loadProgress(mainCurrency: mainCurrency)
        }
        
        if mainCurrency.getGenerators().count > 0 {
            for generator in mainCurrency.getGenerators() {
                let dev = generator as! DevsDesk
                dev.delegate = self
                background.addChild(generator as! DevsDesk)
            }
        }
        else {
            
            let initialPoint = (x: 0.0, y: 844.5)
            let downLeft = (x: -97, y: -56)
            let downRight = (x: 97, y: -56)
//            let upLeft = (x: -97, y: 56)
//            let upRight = (x: 97, y: 56)
            let down = (x: initialPoint.x, y: -112)
//            let up = (x: initialPoint.x, y: 112)
//            let right = (x: 193, y: initialPoint.y)
//            let left = (x: -193, y: initialPoint.y)
            
            //Devs creation
            let devsDesk = DevsDesk(character: "designer",
                                    x: CGFloat(initialPoint.x),
                                    y: CGFloat(initialPoint.y),
                                    perSec: 20,
                                    increase: 2,
                                    id: 0, basePrice: 500,
                                    observer: mainCurrency,
                                    equipmentLevel: 0,
                                    equipmentMultiply: 0,
                                    equipmentPriceMultiplier: 1.1,
                                    currentLevel: 0,
                                    equipmentCurrentPrice: 500 * 0.2,
                                    currentPrice: 500)
            devsDesk.delegate = self
            mainCurrency.addGenerator(generator: devsDesk)
            background.addChild(devsDesk)
            
            let devsDesk2 = DevsDesk(character: "dev",
                                     x: CGFloat(initialPoint.x) - CGFloat(downLeft.x * -6),
                                     y: CGFloat(initialPoint.y) - CGFloat(downLeft.y * -6),
                                     perSec: 20,
                                     increase: 2,
                                     id: 1,
                                     basePrice: 500,
                                     observer: mainCurrency,
                                     equipmentLevel: 0,
                                     equipmentMultiply: 0,
                                     equipmentPriceMultiplier: 1.1,
                                     currentLevel: 0,
                                     equipmentCurrentPrice: 500 * 0.2,
                                     currentPrice: 500)
            devsDesk2.delegate = self
            mainCurrency.addGenerator(generator: devsDesk2)
            background.addChild(devsDesk2)
            
            let devsDesk3 = DevsDesk(character: "dev",
                                     x: CGFloat(initialPoint.x) - CGFloat(downLeft.x * -12),
                                     y: CGFloat(initialPoint.y) - CGFloat(downLeft.y * -12),
                                     perSec: 20,
                                     increase: 2,
                                     id: 1,
                                     basePrice: 500,
                                     observer: mainCurrency,
                                     equipmentLevel: 0,
                                     equipmentMultiply: 0,
                                     equipmentPriceMultiplier: 1.1,
                                     currentLevel: 0,
                                     equipmentCurrentPrice: 500 * 0.2,
                                     currentPrice: 500)
            devsDesk3.delegate = self
            mainCurrency.addGenerator(generator: devsDesk3)
            background.addChild(devsDesk3)
            
            let devsDesk4 = DevsDesk(character: "designer",
                                     x: CGFloat(initialPoint.x) - CGFloat(downRight.x * -6),
                                     y: CGFloat(initialPoint.y) - CGFloat(downRight.y * -6),
                                     perSec: 20,
                                     increase: 2,
                                     id: 1,
                                     basePrice: 500,
                                     observer: mainCurrency,
                                     equipmentLevel: 0,
                                     equipmentMultiply: 0,
                                     equipmentPriceMultiplier: 1.1,
                                     currentLevel: 0,
                                     equipmentCurrentPrice: 500 * 0.2,
                                     currentPrice: 500)
            devsDesk4.delegate = self
            mainCurrency.addGenerator(generator: devsDesk4)
            background.addChild(devsDesk4)
            
            let devsDesk5 = DevsDesk(character: "designer",
                                     x: CGFloat(initialPoint.x) - CGFloat(downRight.x * -12),
                                     y: CGFloat(initialPoint.y) - CGFloat(downRight.y * -12),
                                     perSec: 20,
                                     increase: 2,
                                     id: 1,
                                     basePrice: 500,
                                     observer: mainCurrency,
                                     equipmentLevel: 0,
                                     equipmentMultiply: 0,
                                     equipmentPriceMultiplier: 1.1,
                                     currentLevel: 0,
                                     equipmentCurrentPrice: 500 * 0.2,
                                     currentPrice: 500)
            devsDesk5.delegate = self
            mainCurrency.addGenerator(generator: devsDesk5)
            background.addChild(devsDesk5)
            
            let devsDesk6 = DevsDesk(character: "dev",
                                     x: CGFloat(down.x),
                                     y: CGFloat(initialPoint.y) - CGFloat(down.y * -6),
                                     perSec: 20,
                                     increase: 2,
                                     id: 1,
                                     basePrice: 500,
                                     observer: mainCurrency,
                                     equipmentLevel: 0,
                                     equipmentMultiply: 0,
                                     equipmentPriceMultiplier: 1.1,
                                     currentLevel: 0,
                                     equipmentCurrentPrice: 500 * 0.2,
                                     currentPrice: 500)
            devsDesk6.delegate = self
            mainCurrency.addGenerator(generator: devsDesk6)
            background.addChild(devsDesk6)
            
            let devsDesk7 = DevsDesk(character: "dev",
                                     x: CGFloat(down.x),
                                     y: CGFloat(initialPoint.y) - CGFloat(down.y * -12),
                                     perSec: 20,
                                     increase: 2,
                                     id: 1,
                                     basePrice: 500,
                                     observer: mainCurrency,
                                     equipmentLevel: 0,
                                     equipmentMultiply: 0,
                                     equipmentPriceMultiplier: 1.1,
                                     currentLevel: 0,
                                     equipmentCurrentPrice: 500 * 0.2,
                                     currentPrice: 500)
            devsDesk7.delegate = self
            mainCurrency.addGenerator(generator: devsDesk7)
            background.addChild(devsDesk7)
            
            let devsDesk8 = DevsDesk(character: "dev",
                                     x: CGFloat(down.x) - CGFloat(downLeft.x * -6),
                                     y: ((CGFloat(initialPoint.y) - CGFloat(down.y * -6)) - CGFloat(downLeft.y * -6)),
                                     perSec: 20,
                                     increase: 2,
                                     id: 1,
                                     basePrice: 500,
                                     observer: mainCurrency,
                                     equipmentLevel: 0,
                                     equipmentMultiply: 0,
                                     equipmentPriceMultiplier: 1.1,
                                     currentLevel: 0,
                                     equipmentCurrentPrice: 500 * 0.2,
                                     currentPrice: 500)
            devsDesk8.delegate = self
            mainCurrency.addGenerator(generator: devsDesk8)
            background.addChild(devsDesk8)
            
            let devsDesk9 = DevsDesk(character: "dev",
                                     x: CGFloat(down.x) - CGFloat(downRight.x * -6),
                                     y: ((CGFloat(initialPoint.y) - CGFloat(down.y * -6)) - CGFloat(downRight.y * -6)),
                                     perSec: 20,
                                     increase: 2,
                                     id: 1,
                                     basePrice: 500,
                                     observer: mainCurrency,
                                     equipmentLevel: 0,
                                     equipmentMultiply: 0,
                                     equipmentPriceMultiplier: 1.1,
                                     currentLevel: 0,
                                     equipmentCurrentPrice: 500 * 0.2,
                                     currentPrice: 500)
            devsDesk9.delegate = self
            mainCurrency.addGenerator(generator: devsDesk9)
            background.addChild(devsDesk9)
            
        }
        
        addChild(cameraNode)
         
        SoundController.backgroundMusic(parentNode: background)
        startIncrement()
    }
    
    override func update(_ currentTime: TimeInterval) {
        topTab.updateLabels()
    }

    func startIncrement() {
        run(perSecIncrement, withKey: "perSecIncrement")
    }
    
    func stopIncrement() {
        removeAction(forKey: "perSecIncrement")
    }
   
}

extension GameScene: DevDelegate {
    func didTapDev(character: Generator) {
        var isIn: Bool = false
        for child in cameraNode.children {
            if child.name == "GeneratorUpgradeMenu" {
                isIn = true
            }
        }
        if !isIn {
            self.cameraNode.addChild(GeneratorUpgradeMenu(generator: character))
        }
    }
}
