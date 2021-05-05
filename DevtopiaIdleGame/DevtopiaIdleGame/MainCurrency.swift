//
//  MainCurrency.swift
//  DevtopiaIdleGame
//
//  Created by Lucas Dimer Justo on 04/05/21.
//

import Foundation

public class MainCurrency {
    private var devCoins: Decimal //current amount of devCoins that the player earn
    private var devCoinsPerSec: Decimal //current amount of devCoins that the player is generating per second
    private var generators: [Generator] //all the generators that the player has
    private var offlineMultiplier: Decimal //the multiplier to know how much the player made per sec while offline (10%)
    
    init(){
        devCoins = Decimal(50)
        devCoinsPerSec = Decimal(0)
        generators = [Generator]()
        offlineMultiplier = Decimal(0.1)
    }
    
    func getDevCoins() -> Decimal {
        return devCoins
    }
    
    func getDevCoinsPerSec() -> Decimal {
        return devCoinsPerSec
    }
    
    func addGenerator(generator: Generator) {
        generators.append(generator)
    }
    
    func updateDevCoinsPerSec(){
        devCoinsPerSec = 0
        for g in generators {
            devCoinsPerSec += g.getCurrencyPerSec()
        }
    }
    
    func updateDevCoins(){
        devCoins += devCoinsPerSec
    }
    
    func updateDevCoins(value: Decimal){
        devCoins += value
    }
}
