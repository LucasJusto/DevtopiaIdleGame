//
//  GameSave.swift
//  DevtopiaIdleGame
//
//  Created by Guilherme Valent Antonini on 11/05/21.
//

import Foundation
import UIKit

struct GameSave {
    
    let userDefaults = UserDefaults.standard

    
    func setValue(value: Any = 0, label: String) {
        
        userDefaults.setValue(value, forKey: label)
    }
    
    
    
    func getValue(label: String) -> Any {
        
        if let valueGetter = userDefaults.value(forKey: label) as Any? {
            return valueGetter 
        }
        return 0
    }
    
    
    
    func unwrap(any:Any) -> Any {
        
        let mi = Mirror(reflecting: any)
        if mi.displayStyle != .optional {
            return any
        }
        
        if mi.children.count == 0 { return NSNull() }
        let (_, some) = mi.children.first!
        return some
        
    }
    
    
}
