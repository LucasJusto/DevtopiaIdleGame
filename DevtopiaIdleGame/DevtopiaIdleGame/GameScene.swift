//
//  GameScene.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 03/05/21.
//

import SpriteKit
import Foundation

class GameScene: SKScene {
    
    // MARK: Propriedades
    
    //váriavel para a o fundo da cena
    private lazy var background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "Piso")
        //setter da posição do backgroud para a posição x: 0 , y: 0 [Item 2 do check-list]
        background.position = CGPoint(x: 0 , y: 0)
        //setter da anchorPoint do backgroud para a posição x: 0 , y: 0 [Item 1 do check-list]
        background.anchorPoint = CGPoint(x: 0, y:0)
        background.zPosition = 0
        return background
    }()
    
    //Camera do jogo
    private lazy var cameraNode: Camera = {
        let cameraNode = Camera(sceneView: self.view!, cenario: background)
        //setter da posição inicial para o valor de x igual a metade da largura de sua tela e de y igual a metade da altura da tela. [Item 4 do check-list]
        cameraNode.position = CGPoint(x:UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        return cameraNode
    }()
    
    override func didMove(to view: SKView) {
        //setter da anchorPoint da GameScene para a posição x: 0 , y: 0 [Item 1 do check-list]
        anchorPoint = CGPoint(x: 0, y:0)
        //setter do tamanho da GameScene para o tamanho do cenário [Item 3 do check-list]
        self.size = background.size
        
        //atribui a câmera da GameScene a câmera customizada.
        camera = cameraNode
        
        //adiciona a câmera e o cenário como filhas da GameScene
        addChild(background)
        addChild(cameraNode)
    }
}


