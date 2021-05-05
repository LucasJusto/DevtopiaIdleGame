
import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            if let view = self.view as! SKView? {
                // Carrega SKScene da classe GameScene.swift
                let scene = GameScene(size: view.bounds.size)
                scene.scaleMode = .resizeFill
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
                
                view.presentScene(scene)
            }
        }
        
        override var shouldAutorotate: Bool {
            return true
        }
        
        override var prefersStatusBarHidden: Bool {
            return true
        }
}

