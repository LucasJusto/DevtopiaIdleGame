import Foundation
import SpriteKit

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
    
    func getGenerators() -> [Generator] {
        return generators
    }
    
    func setDevCoins(value: Decimal) {
        devCoins = value
    }
    
    func addGenerator(generator: Generator) {
        generators.append(generator)
        self.updateDevCoinsPerSec()
    }
    
    func updateDevCoinsPerSec() {
        devCoinsPerSec = 0
        for g in generators {
            devCoinsPerSec += g.getCurrencyPerSec()
        }
    }
    
    func updateDevCoins() {
        devCoins += devCoinsPerSec
    }
    
    func updateDevCoins(value: Decimal){
        devCoins += value
    }
    
    func addMultiplier(multiplier: Multiplier) {
        multipliers.append(multiplier)
        for g in generators {
            g.setMultipliers(ms: multipliers)
        }
        self.updateDevCoinsPerSec()
    }
    
    func decimalToString(value: Decimal) -> String {
        //convert devCoins or devCoinsPerSec to String using K, M, B, T, AA, AB...
        var str: String = ""
        var n: String = "0"
        
        if value < pow(10, 3) {
            str = ""
            n = "\(value)"
        }
        else if value < pow(10, 6) {
            str = "K"
            n = "\(value/pow(10, 3))"
        }
        else if value < pow(10, 9) {
            str = "M"
            n = "\(value/pow(10, 6))"
        }
        else if value < pow(10, 12) {
            str = "B"
            n = "\(value/pow(10, 9))"
        }
        else if value < pow(10, 15) {
            str = "T"
            n = "\(value/pow(10, 12))"
        }
        else if value < pow(10, 18) {
            str = "AA"
            n = "\(value/pow(10, 15))"
        }
        else if value < pow(10, 21) {
            str = "AB"
            n = "\(value/pow(10, 18))"
        }
        else if value < pow(10, 24) {
            str = "AC"
            n = "\(value/pow(10, 21))"
        }
        else if value < pow(10, 27) {
            str = "AD"
            n = "\(value/pow(10, 24))"
        }
        else if value < pow(10, 30) {
            str = "AE"
            n = "\(value/pow(10, 27))"
        }

        
        let splitedN = n.split(separator: ".")
        let nInteger: String = "\(splitedN[0])"
        var nDecimal: String = "00"
        if splitedN.count > 1  {
            nDecimal = "\(splitedN[1].prefix(2))"
        }
        return "\(nInteger).\(nDecimal)\(str)"
    }
      
    func updateDevCoinsWhenBack(timeAway: Decimal, gameScene: GameScene) {
        var hasChild: SKSpriteNode? = nil
        for child in gameScene.cameraNode.children {
            if child.name == "welcomeBackPopUp" {
                hasChild = (child as! SKSpriteNode)
            }
        }
        if (hasChild != nil) {
            (hasChild as! WelcomeBackPopUp).mainCurrency.updateDevCoins(value: (hasChild as! WelcomeBackPopUp).value)
            (hasChild as! WelcomeBackPopUp).removeFromParent()
            
        }
        gameScene.cameraNode.addChild(WelcomeBackPopUp(mainCurrency: self, value: timeAway * devCoinsPerSec * 0.1, timeAway: timeAway))
        
    }
}
