//
//  Player.swift
//  RPG OOP
//
//  Created by Tihomir Videnov on 2/22/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
           return _inventory
        }
        
    }
    
    func addItemToInventory(_ item: String) {
        _inventory.append(item)
    }
    
        convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }
    
}
