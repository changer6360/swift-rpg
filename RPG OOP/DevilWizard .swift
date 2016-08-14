//
//  DevilWizard .swift
//  RPG OOP
//
//  Created by Tihomir Videnov on 2/25/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        
        return ["Magic Wand","Dark Amulet","Salted Pork"]
    }
    
    override var type: String {
        
        return "Devil Wizard"
    }
}