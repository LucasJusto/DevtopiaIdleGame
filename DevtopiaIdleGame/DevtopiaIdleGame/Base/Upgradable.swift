import Foundation

protocol Upgradable: AnyObject {
    var id: Int { get }
    var currentPrice: Decimal { get set} //price to upgrade it now | starts with basePrice
    var basePrice: Decimal { get set} //price to buy it and calculate next upgrades
    var currentLevel: Int { get set} //current upgrade level | starts at 1
    var increase: Decimal { get set } //how much will increase when upgrading
    var observer: MainCurrency { get set } //the MainCurrency class needs to know when it is upgraded to recalculate the currencypPerSec.
    
    func upgrade()
}

extension Upgradable {
    func upgrade() {
        currentLevel += 1
        currentPrice *= 1.1
        observer.updateDevCoinsPerSec()
    }
    
}

