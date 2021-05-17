import SpriteKit
import Foundation

class GameScene: SKScene {
//    var gameBackgroundMusic: SKAudioNode!
    
    
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
    
    // MARK: Propriedades
    //váriavel para a o fundo da cena
    private lazy var background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "Piso")
        //setter da posição do backgroud para a posição x: 0.5 , y: 0.5
        background.position = CGPoint(x: 0.5,y: 0.5)
        //setter da anchorPoint do backgroud para a posição x: 0.5 , y: 0.5
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 0
        
        return background
    }()
    
    
    //Camera do jogo
    private lazy var cameraNode: Camera = {
        let cameraNode = Camera(sceneView: self.view!, cenario: background)
        //setter da posição inicial para o valor de x igual a metade da largura de sua tela e de y igual a metade da altura da tela.
        cameraNode.position = CGPoint(x:UIScreen.main.bounds.width / 50, y: UIScreen.main.bounds.height / 2)
        cameraNode.applyZoomScale(scale: 0.5)
        topTab = TopTab(mainCurrency: mainCurrency)
        cameraNode.addChild(topTab)
        keyboard = KeyboardButton(mainCurrency: mainCurrency)
        cameraNode.addChild(keyboard)
        return cameraNode
    }()
    
    override func didMove(to view: SKView) {
        
        //setter da anchorPoint da GameScene para a posição x: 0 , y: 0
        anchorPoint = CGPoint(x: 0, y: 0)
        //setter do tamanho da GameScene para o tamanho do cenário
        self.size = background.size
        
        //atribui a câmera da GameScene a câmera customizada.
        camera = cameraNode
        
        //adiciona a câmera e o cenário como filhas da GameScene
        addChild(background)
        let devsDesk = DevsDesk(x: 0, y: 844.5, perSec: 20, increase: 2, id: 0, basePrice: 500, observer: mainCurrency)
        devsDesk.delegate = self
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

