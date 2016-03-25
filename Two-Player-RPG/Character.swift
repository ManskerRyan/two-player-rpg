//
//  Character.swift
//  Two-Player-RPG
//
//  Created by Ryan Alexander Mansker on 3/25/16.
//  Copyright © 2016 Ryan Alexander Mansker. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int!
    private var _attackPwr: Int!
    private var _name: String!
    private var _imgChoice: String!
    
    var hp: Int {
        return _hp
    }
    
    var attackPwr: Int {
        return _attackPwr
    }
    
    var name: String {
        return _name
    }
    
    var imgChoice: String {
        return _imgChoice
    }
    
    init(hp: Int, attackPwr: Int, name: String) {
        _hp = hp
        _attackPwr = attackPwr
        _name = name
        
    }
    
    init(hp: Int, attackPwr: Int, name: String, imgChoice: String) {
        _hp = hp
        _attackPwr = attackPwr
        _name = name
        _imgChoice = imgChoice
    }
    
    func isAlive() -> Bool {
        if _hp <= 0 {
            return false
        }
        
        return true
    }
    
    func wasAttacked(attackPwr: Int) {
        _hp = _hp - attackPwr
    }
    
    func inputName(name: String) {
        
    }
    
    func chooseCharacter() {
        
    }
}
