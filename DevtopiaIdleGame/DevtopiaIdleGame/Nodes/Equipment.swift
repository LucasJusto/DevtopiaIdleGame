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
    
    public init(id: Int, basePrice: Decimal, observer: MainCurrency){
        self.name = "desk"
        self.multiply = 0
        self.id = id
        self.currentPrice = basePrice
        self.basePrice = basePrice
        self.currentLevel = 0
        self.increase = 0.01
        self.observer = observer
        self.changeVisual1 = 1
        self.changeVisual2 = 5
        self.priceMultiplier = 1.1
    }
}
