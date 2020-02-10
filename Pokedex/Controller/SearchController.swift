//
//  SearchController.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    
    var pokemonList:[Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set([Int](), forKey: "favoritesArray")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func generateRandom(_ sender: Any) {
        pokemonList = PokemonHelpers.generateRandomPokemon(20)
        //RandomPokemon.testWorking(pokemonList)
        
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToResultsVC" {
            let destinationVC = segue.destination as! ResultController
            destinationVC.randomPokemonArray = pokemonList
        }
        
        
    }

}
