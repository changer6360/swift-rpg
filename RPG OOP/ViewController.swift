//
//  ViewController.swift
//  RPG OOP
//
//  Created by Tihomir Videnov on 2/22/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var palyerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!

    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "NewDestroyer", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        palyerHpLbl.text = "\(player.hp) HP"
     
        
    }
    
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
            let img = UIImage(named: "enem1.png")
            enemyImg.image = img
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
            let img = UIImage(named: "enem2.png")
            enemyImg.image = img
        }
        
        enemyImg.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    @IBAction func onChestTapped(_ sender: AnyObject) {
        chestBtn.isHidden = true
        printLbl.text = chestMessage
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(_ sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            
            printLbl.text = "Attacked by \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            
            printLbl.text = "Attack was unsuccessful"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot) 
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.isHidden = false
        }
        
        if !enemy.isAlive{
            
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.isHidden = true
        }
        
    }

}

