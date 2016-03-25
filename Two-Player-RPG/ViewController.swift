//
//  ViewController.swift
//  Two-Player-RPG
//
//  Created by Ryan Alexander Mansker on 3/25/16.
//  Copyright © 2016 Ryan Alexander Mansker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
        //Major Bg props
    @IBOutlet weak var mountainBg: UIImageView!
    @IBOutlet weak var groundBg: UIImageView!
    @IBOutlet weak var attackLblBox: UIImageView!
    
        //Labels
    @IBOutlet weak var battleTxtLbl: UILabel!
    @IBOutlet weak var enemyHPLbl: UILabel!
    @IBOutlet weak var playerHp: UILabel!
    
        //Button & Info
    @IBOutlet weak var enemyAttack: UIButton!
    @IBOutlet weak var enemyAttackLbl: UILabel!
    @IBOutlet weak var playerAttack: UIButton!
    @IBOutlet weak var playerAttackLbl: UILabel!
    
        //Player Imgs
    @IBOutlet weak var enemy: UIImageView!
    @IBOutlet weak var player: UIImageView!
    
        //Game Variables
    var winner: String?
    var playerOne: Character!
    var playerTwo: Character!
    
    //Make sure this actually changes the player's propeties
    var buttonTapped: Character!
    var characterAttacked: Character!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOne = Character(hp: 100, attackPwr: 20, name: "Player One")
        playerTwo = Character(hp: 100, attackPwr: 20, name: "Player Two")
    }
    func btnUnPause() {
        playerAttack.hidden = false
        playerAttackLbl.hidden = false
        enemyAttack.hidden = false
        enemyAttackLbl.hidden = false
    }
    
    func btnPause() {
        playerAttack.hidden = true
        playerAttackLbl.hidden = true
        enemyAttack.hidden = true
        enemyAttackLbl.hidden = true
    }

    @IBAction func onAttackTapped(button: UIButton) {
        if button.tag == 1 {
            buttonTapped = playerTwo
            characterAttacked = playerOne
        } else if button.tag == 2 {
            buttonTapped = playerOne
            characterAttacked = playerTwo
        }
        
        buttonTapped.wasAttacked(playerOne.attackPwr)
        if characterAttacked.isAlive() == false {
            //End Game code here
        } else {
            btnPause()
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: (#selector(ViewController.btnUnPause)), userInfo: nil, repeats: true)
        }
    }
}

