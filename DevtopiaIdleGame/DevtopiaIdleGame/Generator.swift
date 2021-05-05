//
//  Generator.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 04/05/21.
//

import Foundation

protocol Generator: Upgradable {
    
    var perSec: Decimal { get set } //generate this amount of currency per sec
    var multipliers: [Multiplier] { get set} //multipliers to multiply the generation per sec
    
    func getCurrencyPerSec() -> Decimal
    
}

extension Generator {
    func getCurrencyPerSec() -> Decimal {
        var multiplier: Decimal = Decimal(1)
        for m in multipliers {
            multiplier += m.multiply
        }
        return perSec * multiplier
    }
    
    mutating func upgrade() {
        currentLevel += 1
        currentPrice *= 1.1
        perSec += increase
    }
}
