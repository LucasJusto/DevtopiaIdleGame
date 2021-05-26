import SpriteKit
import Foundation

class OnboardingScene: SKScene {
    
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
        let background = SKSpriteNode(imageNamed: "Piso_Onboarding")
        // Background position setter x: 0.5 , y: 0.5
        background.position = CGPoint(x: 0.5,y: 0.5)
        // Background anchorPoint setter x: 0.5 , y: 0.5
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 0
        
        return background
    }()
    
    
    // Game camera
    public lazy var cameraNode: Camera = {
        let cameraNode = Camera(sceneView: self.view!, scenario: background)
        cameraNode.position = CGPoint(x:UIScreen.main.bounds.width/16, y: UIScreen.main.bounds.height/8)
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
        self.size = UIScreen.main.bounds.size
        
        // Attributes GameScene camera to customized camera
        camera = cameraNode
        
        // Adds camera to background as child
        addChild(background)
        
        let initialPoint = (x: -200, y: 50)
        
        //Dev creation
        let devsDesk = DevsDesk(character: "starter",
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

extension OnboardingScene: DevDelegate {
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
