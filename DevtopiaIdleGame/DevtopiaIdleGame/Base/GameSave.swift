//
//  GameSave.swift
//  DevtopiaIdleGame
//
//  Created by Guilherme Valent Antonini on 11/05/21.
//

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
    
    
}
