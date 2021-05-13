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
    private var multipliers: [Multiplier] //all the multipliers the player has
    
    init(){
        devCoins = Decimal(500)
        devCoinsPerSec = Decimal(0)
        generators = [Generator]()
        offlineMultiplier = Decimal(0.1)
        multipliers = [Multiplier]()
    }
    
    func getDevCoins() -> Decimal {
        return devCoins
    }
    
    func getDevCoinsPerSec() -> Decimal {
        return devCoinsPerSec
    }
    
    func addGenerator(generator: Generator) {
        generators.append(generator)
        for g in generators {
            g.setMultipliers(ms: multipliers)
        }
        self.updateDevCoinsPerSec()
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
    
    func addMultiplier(multiplier: Multiplier){
        multipliers.append(multiplier)
        for g in generators {
            g.setMultipliers(ms: multipliers)
        }
        self.updateDevCoinsPerSec()
    }
    
    func decimalToString(value: Decimal) -> String {
        //convert devCoins or devCoinsPerSec to String using K, M, B, T, AA, AB...
        var ret: String?
        
        if value < pow(10, 3) {
            ret = "\(value)"
        }
        else if value < pow(10, 6) {
            ret = "\(value/pow(10, 3))K"
        }
        else if value < pow(10, 9) {
            ret = "\(value/pow(10, 6))M"
        }
        else if value < pow(10, 12) {
            ret = "\(value/pow(10, 9))B"
        }
        else if value < pow(10, 15) {
            ret = "\(value/pow(10, 12))T"
        }
        else if value < pow(10, 18) {
            ret = "\(value/pow(10, 15))AA"
        }
        else if value < pow(10, 21) {
            ret = "\(value/pow(10, 18))AB"
        }
        
        return ret!
    }
}
