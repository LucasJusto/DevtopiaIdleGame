//
//  Equipment.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 10/05/21.
//

import Foundation

class Equipment: Multiplier {
    var changeVisual1: Int
    var changeVisual2: Int
    var priceMultiplier: Decimal
    var multiply: Decimal
    var id: Int
    var currentPrice: Decimal
    var basePrice: Decimal
    var currentLevel: Int
    var increase: Decimal
    var observer: MainCurrency
    var name: String
    
    public init(id: Int, basePrice: Decimal, observer: MainCurrency, currentPrice: Decimal, currentLevel: Int, multiply: Decimal, priceMultiplier: Decimal) {
        self.name = "desk"
        self.multiply = multiply
        self.id = id
        self.basePrice = basePrice
        self.currentPrice = currentPrice
        self.currentLevel = currentLevel
        self.increase = 0.01
        self.observer = observer
        self.changeVisual1 = 30
        self.changeVisual2 = 70
        self.priceMultiplier = priceMultiplier
    }
}
