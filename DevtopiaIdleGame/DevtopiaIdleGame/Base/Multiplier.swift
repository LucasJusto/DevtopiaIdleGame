//
//  Multiplier.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 05/05/21.
//

import Foundation

protocol Multiplier: Upgradable {
    var name: String {get set}
    
    var multiply: Decimal { get set } //value to multiply the generate per sec from a generator. example: 0 = 0%;  0.01 = 1%...
    
    var changeVisual1: Int { get set }
    
    var changeVisual2: Int { get set }
    
    var priceMultiplier: Decimal { get set }
    
}

extension Multiplier {
    func upgrade() {
        currentLevel += 1
        currentPrice *= priceMultiplier
        multiply += increase
        observer.updateDevCoinsPerSec()
        if currentLevel >= changeVisual1 && currentLevel < changeVisual2{
            increase += 0.005
            priceMultiplier = 1.15
        }
        else if currentLevel >= changeVisual2 {
            increase += 0.01
            priceMultiplier = 1.2
        }
    }
}
