import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    let gameSave = GameSave()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            if let view = self.view as! SKView? {
                // Carrega SKScene da classe GameScene.swift
                
                if gameSave.getFirstTimePlaying() {
                    let scene = OnboardingScene(size: view.bounds.size)
                    let delegate = UIApplication.shared.delegate as? AppDelegate
                    delegate?.mainCurrency = scene.mainCurrency
                    //delegate?.gameScene = scene
                    scene.scaleMode = .resizeFill
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = false
                    view.showsNodeCount = false
                    view.isMultipleTouchEnabled = true
                    view.isUserInteractionEnabled = true
                    
                    view.presentScene(scene)
                } else {
                    let scene = GameScene(size: view.bounds.size)
                    let delegate = UIApplication.shared.delegate as? AppDelegate
                    delegate?.mainCurrency = scene.mainCurrency
                    delegate?.gameScene = scene
                    scene.scaleMode = .resizeFill
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = false
                    view.showsNodeCount = false
                    view.isMultipleTouchEnabled = true
                    view.isUserInteractionEnabled = true
                    
                    view.presentScene(scene)
                }
                
                
            }
        }
        
        override var shouldAutorotate: Bool {
            return false
        }
        
        override var prefersStatusBarHidden: Bool {
            return false
        }

}

