//
//  MainScene.swift
//  DevtopiaIdleGame
//
//  Created by Matheus Homrich on 04/05/21.
//

import SwiftUI
import SpriteKit

struct MainScene: View {
    
    var body: some View {
        SpriteView(scene: GameScene())
    }
}



struct MainScene_Previews: PreviewProvider {
    static var previews: some View {
        MainScene()
    }
}
