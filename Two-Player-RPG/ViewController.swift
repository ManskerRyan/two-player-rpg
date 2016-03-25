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
    var btnTapped: Bool?
    var playerOne: Character!
    var playerTwo: Character!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onPlayerAttackTapped(sender: AnyObject) {
        
    }

    @IBAction func onEnemyAttackTapped(sender: AnyObject) {
        
    }
}

