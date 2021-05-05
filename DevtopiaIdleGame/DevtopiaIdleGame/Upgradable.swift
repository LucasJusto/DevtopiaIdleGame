//
//  Upgradable.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 04/05/21.
//

import Foundation

protocol Upgradable {
    var id: Int { get }
    var currentPrice: Decimal { get set} //price to upgrade it now | starts with basePrice
    var basePrice: Decimal { get set} //price to buy it and calculate next upgrades
    var currentLevel: Int { get set} //current upgrade level | starts at 1
    var increase: Decimal { get set } //how much will increase when upgrading
    
    mutating func upgrade()
}

extension Upgradable {
    mutating func upgrade() {
        currentLevel += 1
        currentPrice *= 1.1
    }
    
}

