//
//  SearchButtonExtension.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/15/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation
import UIKit

extension SearchController {
    @IBAction func bugPressed(_ sender: Any) {
        typesPressed[.Bug] = !typesPressed[.Bug]!
        getbtntext(sender as! UIButton, .Bug)
    }
    @IBAction func icePressed(_ sender: Any) {
        typesPressed[.Ice] = !typesPressed[.Ice]!
        getbtntext(sender as! UIButton, .Ice)
    }
    @IBAction func darkPressed(_ sender: Any) {
        typesPressed[.Dark] = !typesPressed[.Dark]!
        getbtntext(sender as! UIButton, .Dark)
    }
    @IBAction func groundPressed(_ sender: Any) {
        typesPressed[.Ground] = !typesPressed[.Ground]!
        getbtntext(sender as! UIButton, .Ground)
    }
    @IBAction func dragonPressed(_ sender: Any) {
        typesPressed[.Dragon] = !typesPressed[.Dragon]!
        getbtntext(sender as! UIButton, .Dragon)
    }
    @IBAction func grassPressed(_ sender: Any) {
        typesPressed[.Grass] = !typesPressed[.Grass]!
        getbtntext(sender as! UIButton, .Grass)
    }
    @IBAction func electricPressed(_ sender: Any) {
        typesPressed[.Electric] = !typesPressed[.Electric]!
        getbtntext(sender as! UIButton, .Electric)
    }
    @IBAction func normalPressed(_ sender: Any) {
        typesPressed[.Normal] = !typesPressed[.Normal]!
        getbtntext(sender as! UIButton, .Normal)
    }
    @IBAction func flyingPressed(_ sender: Any) {
        typesPressed[.Flying] = !typesPressed[.Flying]!
        getbtntext(sender as! UIButton, .Flying)
    }
    @IBAction func poisonPressed(_ sender: Any) {
        typesPressed[.Poison] = !typesPressed[.Poison]!
        getbtntext(sender as! UIButton, .Poison)
    }
    @IBAction func fightingPressed(_ sender: Any) {
        typesPressed[.Fighting] = !typesPressed[.Fighting]!
        getbtntext(sender as! UIButton, .Fighting)
    }
    @IBAction func psychicPressed(_ sender: Any) {
        typesPressed[.Psychic] = !typesPressed[.Psychic]!
        getbtntext(sender as! UIButton, .Psychic)
    }
    @IBAction func firePressed(_ sender: Any) {
        typesPressed[.Fire] = !typesPressed[.Fire]!
        getbtntext(sender as! UIButton, .Fire)
    }
    @IBAction func rockPressed(_ sender: Any) {
        typesPressed[.Rock] = !typesPressed[.Rock]!
        getbtntext(sender as! UIButton, .Rock)
    }
    @IBAction func waterPressed(_ sender: Any) {
        typesPressed[.Water] = !typesPressed[.Water]!
        getbtntext(sender as! UIButton, .Water)
    }
    @IBAction func fairyPressed(_ sender: Any) {
        typesPressed[.Fairy] = !typesPressed[.Fairy]!
        getbtntext(sender as! UIButton, .Fairy)
    }
    @IBAction func steelPressed(_ sender: Any) {
        typesPressed[.Steel] = !typesPressed[.Steel]!
        getbtntext(sender as! UIButton, .Steel)
    }
    @IBAction func ghostPressed(_ sender: Any) {
        typesPressed[.Ghost] = !typesPressed[.Ghost]!
        getbtntext(sender as! UIButton, .Ghost)
    }
    func getbtntext(_ button: UIButton, _ type: PokeType) {
        if typesPressed[type]! {
            button.setTitleColor(UIColor.green, for: .normal)
        } else {
            button.setTitleColor(UIColor.white, for: .normal)
        }
    }
}
