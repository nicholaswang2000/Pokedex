//
//  DetailController.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var PokemonImage: UIImageView!
    @IBOutlet weak var PokemonNameLabel: UILabel!
    
    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var AttackLabel: UILabel!
    @IBOutlet weak var DefenseLabel: UILabel!
    @IBOutlet weak var HealthLabel: UILabel!
    @IBOutlet weak var SpeedLabel: UILabel!
    @IBOutlet weak var SpAttackLabel: UILabel!
    @IBOutlet weak var SpDefenseLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IDLabel.text = "#" + String(pokemon.id)
        PokemonNameLabel.text = pokemon.name
        PokemonImage.image = try? UIImage(withContentsOfUrl: URL(string: pokemon.largeUrl) ?? URL(string: "https://static.thenounproject.com/png/60319-200.png")!)
        TypeLabel.text = pokemon.getTypes()
        TotalLabel.text = String(pokemon.total)
        AttackLabel.text = String(pokemon.attack)
        DefenseLabel.text = String(pokemon.defense)
        HealthLabel.text = String(pokemon.health)
        SpeedLabel.text = String(pokemon.speed)
        SpAttackLabel.text = String(pokemon.specialAttack)
        SpDefenseLabel.text = String(pokemon.specialDefense)
        
    }
    
    func pokemonOneString (_ pokeName: String) -> String {
        let toArray = pokeName.components(separatedBy: " ")
        let backToString = toArray.joined(separator: "+")
        return backToString
    }
    
    @IBAction func searchOnGoogle(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://google.com/search?q=" + pokemonOneString(pokemon.name)) ?? URL(string: "https://google.com/search?q=POKEMON")!)
    }
}
