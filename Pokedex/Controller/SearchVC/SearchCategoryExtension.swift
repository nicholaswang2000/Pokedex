//
//  SearchExtension.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/11/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation
import UIKit

extension SearchController {
    
    @IBAction func grassPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Grass]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Grass)
    }
    @IBAction func bugPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Bug]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Bug)
    }
    @IBAction func pyschicPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Psychic]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Psychic)
    }
    @IBAction func dragonPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Dragon]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Dragon)
    }
    @IBAction func icePressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Ice]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Ice)
    }
    @IBAction func groundPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Ground]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Ground)
    }
    @IBAction func electricPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Electric]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Electric)
    }
    @IBAction func fairyPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Fairy]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Fairy)
    }
    @IBAction func normalPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Normal]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Normal)
    }
    @IBAction func rockPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Rock]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Rock)
    }
    @IBAction func fightingPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Fighting]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Fighting)
    }
    @IBAction func firePressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Fire]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Fire)
    }
    @IBAction func unknownPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Unknown]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Unknown)
    }
    @IBAction func flyingPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Flying]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Flying)
    }
    @IBAction func steelPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Steel]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Steel)
    }
    @IBAction func ghostPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Ghost]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Ghost)
    }
    @IBAction func darkPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Dark]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Dark)
    }
    @IBAction func waterPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Water]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Water)
    }
    @IBAction func poisonPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Poison]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Poison)
    }
    
    func setBtnColor(_ pressed: Bool, _ sender: UIButton, _ poketype: PokeType) {
        if !pressed {
            sender.setTitleColor(UIColor.green, for: .normal)
            typesPressed[poketype] = true
        } else {
            sender.setTitleColor(UIColor.white, for: .normal)
            typesPressed[poketype] = false
            print(pressed)
        }
    }
    
}
