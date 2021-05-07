//
//  Multiplier.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 05/05/21.
//

import Foundation

protocol Multiplier: Upgradable {
    
    var multiply: Decimal { get set } //value to multiply the generate per sec from a generator.
    
}

extension Multiplier {
    func upgrade() {
        currentLevel += 1
        currentPrice *= 1.1
        multiply += increase
        observer.updateDevCoinsPerSec()
    }
}
