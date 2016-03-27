//
//  ViewController.swift
//  Two-Player-RPG
//
//  Created by Ryan Alexander Mansker on 3/25/16.
//  Copyright © 2016 Ryan Alexander Mansker. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //MARK: Properties
        //Major Bg props
    @IBOutlet weak var mountainBg: UIImageView!
    @IBOutlet weak var groundBg: UIImageView!
    @IBOutlet weak var attackLblBox: UIImageView!
    
        //Winning Bg
    @IBOutlet weak var blackBg: UIView!
    @IBOutlet weak var bamBg: UIImageView!
    
        //Labels
    @IBOutlet weak var battleTxtLbl: UILabel!
    @IBOutlet weak var enemyHPLbl: UILabel!
    @IBOutlet weak var playerHp: UILabel!
    @IBOutlet weak var winningLbl: UILabel!
    
    
        //Button & Info
    @IBOutlet weak var enemyAttack: UIButton!
    @IBOutlet weak var enemyAttackLbl: UILabel!
    @IBOutlet weak var playerAttack: UIButton!
    @IBOutlet weak var playerAttackLbl: UILabel!
    @IBOutlet weak var againLbl: UILabel!
    @IBOutlet weak var againBtn: UIButton!
    
        //Player Imgs
    @IBOutlet weak var enemy: UIImageView!
    @IBOutlet weak var player: UIImageView!
    
        //Game Variables
    var playerOne: Character!
    var playerTwo: Character!
    
        //GameSounds
    var playerDie = AVAudioPlayer()
    var orcAttack = AVAudioPlayer()
    var knightAttack = AVAudioPlayer()
    var backgroundFX = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAudio(&playerDie, fileName: "Dying-FX", fileType: "wav")
        loadAudio(&orcAttack, fileName: "Attacknoise-FX", fileType: "wav")
        loadAudio(&knightAttack, fileName: "SwordSwing-FX", fileType: "wav")
        loadAudio(&backgroundFX, fileName: "BG-FX", fileType: "wav")
        
        prepareAudio()
        backgroundFX.play()
        backgroundFX.numberOfLoops = -1
        
        startGame()
    }
    
    func loadAudio(inout fxName: AVAudioPlayer, fileName: String, fileType: String) {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try fxName = AVAudioPlayer(contentsOfURL: soundURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func prepareAudio() {
        playerDie.prepareToPlay()
        orcAttack.prepareToPlay()
        knightAttack.prepareToPlay()
        backgroundFX.prepareToPlay()
    }
    
    func btnToggle() {
        if playerAttack.hidden == false {
            playerAttack.hidden = true
            playerAttackLbl.hidden = true
            enemyAttack.hidden = true
            enemyAttackLbl.hidden = true
        } else {
            playerAttack.hidden = false
            playerAttackLbl.hidden = false
            enemyAttack.hidden = false
            enemyAttackLbl.hidden = false
        }
        
    }
    
    func showWinningMessage() {
        if blackBg.hidden == false {
            blackBg.hidden = true
            bamBg.hidden = true
            winningLbl.hidden = true
            againBtn.hidden = true
            againLbl.hidden = true
        } else {
            blackBg.hidden = false
            bamBg.hidden = false
            winningLbl.hidden = false
            againBtn.hidden = false
            againLbl.hidden = false
        }
    }
    
    func determineEndGame(player: Character, winner: Character) {
        if player.isAlive() == false {
            playerDie.play()
            showWinningMessage()
            winningLbl.text = "\(winner.name) is the winner"
        } else {
            btnToggle()
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: (#selector(ViewController.btnToggle)), userInfo: nil, repeats: false)
        }
    }

    @IBAction func onAttackTapped(button: UIButton) {
        if button.tag == 1 {
            playerOne.wasAttacked(playerTwo.attackPwr)
            determineEndGame(playerOne, winner: playerTwo)
            knightAttack.play()
            playerHp.text = "\(playerOne.hp) HP"
        } else if button.tag == 2 {
            playerTwo.wasAttacked(playerOne.attackPwr)
            enemyHPLbl.text = "\(playerTwo.hp) HP"
            determineEndGame(playerTwo, winner: playerOne)
            orcAttack.play()
        }
    }
    
    @IBAction func startGame() {
        showWinningMessage()
        
        playerOne = Character(hp: 100, attackPwr: 20, name: "PlayerOne")
        playerTwo = Character(hp: 100, attackPwr: 20, name: "PlayerTwo")
        
        playerHp.text = "\(playerOne.hp) HP"
        enemyHPLbl.text = "\(playerTwo.hp) HP"
    }
}

