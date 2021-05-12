import SpriteKit
import Foundation

class GameScene: SKScene {
    var mainCurrency: MainCurrency = MainCurrency()
    var topTab: TopTab!
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
    
//    //váriavel para o developer 1
//    private lazy var developer: SKSpriteNode = {
//        let developer = SKSpriteNode(imageNamed: "Dev_step_01-1")
//        //setter da posição do dev1
//        developer.position = CGPoint(x: 0,y: 844.5)
//        //setter da anchorPoint do dev1 para a posição x: 0.458 , y: 0.5
//        developer.anchorPoint = CGPoint(x: 0.458, y: 0.5)
//        developer.zPosition = 1
//        return developer
//    }()
    
    //Camera do jogo
    private lazy var cameraNode: Camera = {
        let cameraNode = Camera(sceneView: self.view!, cenario: background)
        //setter da posição inicial para o valor de x igual a metade da largura de sua tela e de y igual a metade da altura da tela.
        cameraNode.position = CGPoint(x:UIScreen.main.bounds.width / 50, y: UIScreen.main.bounds.height / 2)
        cameraNode.applyZoomScale(scale: 0.5)
        topTab = TopTab(mainCurrency: mainCurrency)
        cameraNode.addChild(topTab)
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
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        topTab.updateLabels()
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
