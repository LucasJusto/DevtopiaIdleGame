import SpriteKit
import Foundation

class GameScene: SKScene {
    
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
    
    //váriavel para o developer
    private lazy var developer: SKSpriteNode = {
        let developer = SKSpriteNode(imageNamed: "Dev_step_01")
        //setter da posição do dev para a posição x: 0.5 , y: 0.5
        developer.position = CGPoint(x: 0.5,y: 0.5)
        //setter da anchorPoint do dev para a posição x: 0.5 , y: 0.5
        developer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        developer.zPosition = 1
        return developer
    }()
    
    //Camera do jogo
    private lazy var cameraNode: Camera = {
        let cameraNode = Camera(sceneView: self.view!, cenario: background)
        //setter da posição inicial para o valor de x igual a metade da largura de sua tela e de y igual a metade da altura da tela.
        cameraNode.position = CGPoint(x:UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        return cameraNode
    }()
    
    override func didMove(to view: SKView) {
        //setter da anchorPoint da GameScene para a posição x: 0 , y: 0
        anchorPoint = CGPoint(x: 0, y:0)
        //setter do tamanho da GameScene para o tamanho do cenário
        self.size = background.size 
        
        //atribui a câmera da GameScene a câmera customizada.
        camera = cameraNode
        
        //adiciona a câmera e o cenário como filhas da GameScene
        addChild(background)
        addChild(developer)
        addChild(cameraNode)
    }
}


