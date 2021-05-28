import Foundation
import UIKit

struct GameSave {
    
    private enum TypeStore: String {
        case timeLeft
    }
    
    let userDefaults = UserDefaults.standard
    
    func setValue(value: Any = 0, label: String) {
        
        userDefaults.setValue(value, forKey: label)
    }
    
    func getValue(label: String) -> Any {
        
        if let valueGetter = userDefaults.value(forKey: label) as Any? {
            return unwrap(any: valueGetter)
        }
        return 0
    }
    
    func saveTimeLeftApp() {
        userDefaults.setValue(Date(), forKey: TypeStore.timeLeft.rawValue)
    }
    
    func getTimeLeftApp() -> Any {
        return unwrap(any: userDefaults.value(forKey: TypeStore.timeLeft.rawValue) ?? 0)
    }
    
    func getTimeAway() -> Decimal? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let stringDate: String = "\(getTimeLeftApp())"
        guard let convertedTimeAway: Date = dateFormatter.date(from: stringDate) else {
            return nil
        }
        let result: Decimal = Decimal((Calendar.current.dateComponents([.second], from: convertedTimeAway, to: Date()).second ?? 0)) - Decimal((Calendar.current.dateComponents([.second], from: Date(), to: Date()).second ?? 0))
        return result
        
    }
    
    func unwrap(any: Any) -> Any {
        
        let mi = Mirror(reflecting: any)
        if mi.displayStyle != .optional {
            return any
        }
        
        if mi.children.count == 0 { return NSNull() }
        let (_, some) = mi.children.first!
        return some
        
    }
    
    func saveProgress(mainCurrency: MainCurrency) {
        userDefaults.setValue(mainCurrency.getDevCoins(), forKey: "devCoins")
        for i in 0...mainCurrency.getGenerators().count-1 {
            userDefaults.setValue((mainCurrency.getGenerators()[i] as! DevsDesk).character, forKey: "dev\(i)character")
            userDefaults.setValue(mainCurrency.getGenerators()[i].id, forKey: "dev\(i)id")
            userDefaults.setValue(mainCurrency.getGenerators()[i].perSec, forKey: "dev\(i)perSec")
            userDefaults.setValue(mainCurrency.getGenerators()[i].basePrice, forKey: "dev\(i)basePrice")
            userDefaults.setValue(mainCurrency.getGenerators()[i].currentLevel, forKey: "dev\(i)currentLevel")
            userDefaults.setValue(mainCurrency.getGenerators()[i].currentPrice, forKey: "dev\(i)currentPrice")
            userDefaults.setValue(mainCurrency.getGenerators()[i].increase, forKey: "dev\(i)increase")
            userDefaults.setValue((mainCurrency.getGenerators()[i] as! DevsDesk).desk.position.x, forKey: "dev\(i)x")
            userDefaults.setValue((mainCurrency.getGenerators()[i] as! DevsDesk).desk.position.y, forKey: "dev\(i)y")
            userDefaults.setValue((mainCurrency.getGenerators()[i] as! DevsDesk).equipment.currentLevel, forKey: "dev\(i)equipmentLevel")
            userDefaults.setValue((mainCurrency.getGenerators()[i] as! DevsDesk).equipment.multiply, forKey: "dev\(i)equipmentMultiply")
            userDefaults.setValue((mainCurrency.getGenerators()[i] as! DevsDesk).equipment.priceMultiplier, forKey: "dev\(i)equipmentPriceMultiplier")
            userDefaults.setValue((mainCurrency.getGenerators()[i] as! DevsDesk).equipment.currentPrice, forKey: "dev\(i)equipmentCurrentPrice")
        }
    }
    
    func loadProgress(mainCurrency: MainCurrency) {
        let devCoins = unwrap(any: userDefaults.value(forKey: "devCoins")!) as! NSNumber
        mainCurrency.setDevCoins(value: devCoins.decimalValue)
        let nDevs = 9
        for i in 0...nDevs-1 {
            let currentLevel = (unwrap(any: userDefaults.value(forKey: "dev\(i)currentLevel")!) as! Int)
            let equipmentLevel = (unwrap(any: userDefaults.value(forKey: "dev\(i)equipmentLevel")!) as! Int)
            
            var character: String?
            if i == 0 {
                character = "firstDev"
            }
            else if i == 4 || i == 5 {
                character = "whiteDev"
            }
            else if i == 2 || i == 6 || i == 8 {
                character = "blackDev"
            }
            else if i == 1 ||  i == 3 || i == 7 {
                character = "whiteDesigner"
            }
            else {
                
            }
            
            var x: CGFloat?
            var y: CGFloat?
            if i == 0 {
                if equipmentLevel < 30 {
                    x = 0.0
                    y = 844.5
                }
                else if equipmentLevel >= 30{
                    x = -66.5
                    y = 814.5
                }
                
            }
            else if i == 1 {
                if equipmentLevel < 30 {
                    x = -582.0
                    y = 508.5
                }
                else if equipmentLevel >= 30 && equipmentLevel < 70 {
                    x = -581.718017578125
                    y = 527.1079711914062
                }
                else {
                    x = -516.9180297851562
                    y = 494.10797119140625
                }
            }
            else {
                x = (unwrap(any: userDefaults.value(forKey: "dev(i)x")!) as! CGFloat)
                y = (unwrap(any: userDefaults.value(forKey: "dev(i)y")!) as! CGFloat)
            }
            
            //let character: String = (unwrap(any: userDefaults.value(forKey: "dev\(i)character")!) as! String)
            let id: Int = (unwrap(any: userDefaults.value(forKey: "dev\(i)id")!) as! Int)
            let perSec = (unwrap(any: userDefaults.value(forKey: "dev\(i)perSec")!) as! NSNumber)
            let basePrice = (unwrap(any: userDefaults.value(forKey: "dev\(i)basePrice")!) as! NSNumber)
            let currentPrice = (unwrap(any: userDefaults.value(forKey: "dev\(i)currentPrice")!) as! NSNumber)
            let increase = (unwrap(any: userDefaults.value(forKey: "dev\(i)increase")!) as! NSNumber)
            let equipmentMultiply = (unwrap(any: userDefaults.value(forKey: "dev\(i)equipmentMultiply")!) as! NSNumber)
            let equipmentPriceMultiplier = (unwrap(any: userDefaults.value(forKey: "dev\(i)equipmentPriceMultiplier")!) as! NSNumber)
            let equipmentCurrentPrice = (unwrap(any: userDefaults.value(forKey: "dev\(i)equipmentCurrentPrice")!) as! NSNumber)
            
            mainCurrency.addGenerator(generator: DevsDesk(character: character!, x: x!, y: y!, perSec: perSec.decimalValue, increase: increase.decimalValue, id: id, basePrice: basePrice.decimalValue, observer: mainCurrency, equipmentLevel: equipmentLevel, equipmentMultiply: equipmentMultiply.decimalValue, equipmentPriceMultiplier: equipmentPriceMultiplier.decimalValue, currentLevel: currentLevel, equipmentCurrentPrice: equipmentCurrentPrice.decimalValue, currentPrice: currentPrice.decimalValue))
        }
        
    }
    
}
