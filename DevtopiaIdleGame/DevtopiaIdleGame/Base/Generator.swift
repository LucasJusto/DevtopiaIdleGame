import Foundation

protocol Generator: Upgradable {
    
    var perSec: Decimal { get set } //generate this amount of currency per sec
    var multipliers: [Multiplier] { get set} //multipliers to multiply the generation per sec
    
    func getCurrencyPerSec() -> Decimal
    
    func addMultiplier(m: Multiplier)
    
    func setMultipliers(ms: [Multiplier])
    
    func getIncrease() -> Decimal
}

extension Generator {
    func getCurrencyPerSec() -> Decimal {
        var multiplier: Decimal = Decimal(1)
        for m in multipliers {
            multiplier += m.multiply
        }
        return perSec * multiplier
    }
    
    func getIncrease() -> Decimal {
        var multiplier: Decimal = Decimal(1)
        for m in multipliers {
            multiplier += m.multiply
        }
        return increase * multiplier

    }
    
    func upgrade() {
        currentLevel += 1
        currentPrice *= 1.1
        perSec += increase
        observer.updateDevCoinsPerSec()
    }
    
   func addMultiplier(m: Multiplier) {
        multipliers.append(m)
        observer.updateDevCoinsPerSec()
    }
    
    func setMultipliers(ms: [Multiplier]) {
        multipliers = ms
    }
}
