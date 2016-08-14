//
//  Kimara.swift
//  RPG OOP
//
//  Created by Tihomir Videnov on 2/25/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import Foundation


class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide","Kimara Venom","Rare Trident"]
    
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(_ attackPwr: Int) -> Bool {
        
        if attackPwr >= IMMUNE_MAX {
            
            return super.attemptAttack(attackPwr)
        } else { 
            return false
        }
    }
}
