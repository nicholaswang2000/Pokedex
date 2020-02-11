//
//  SearchSegueExtension.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/11/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation
import UIKit

extension SearchController {
    
    @IBAction func generateRandom(_ sender: Any) {
        randomPokemonList = PokemonHelpers.generateRandomPokemon(20)
        //RandomPokemon.testWorking(randomPokemonList)
        searchOrRandom = 0
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    @IBAction func listAllPokemon(_ sender: Any) {
        searchOrRandom = 4
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    @IBAction func searchByCategory(_ sender: Any) {
        normalView.isHidden = true
        optionsView.isHidden = true
        categoryView.isHidden = false
        typeView.isHidden = true
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        optionsView.isHidden = false
        normalView.isHidden = true
        categoryView.isHidden = true
        typeView.isHidden = true
        dismissKeyboard()
    }
    
    
    // Implement category search last
    @IBAction func typeSearch(_ sender: Any) {
        searchOrRandom = 1
        optionsView.isHidden = true
        normalView.isHidden = true
        categoryView.isHidden = true
        typeView.isHidden = false
    }
    
    @IBAction func timeToSearch(_ sender: Any) {
        categoryArray = PokemonHelpers.getPokeTypeArray(typesPressed)
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    @IBAction func nameSearch(_ sender: Any) {
        searchOrRandom = 2
        assertTextNotEmpty()
    }
    
    @IBAction func numberSearch(_ sender: Any) {
        searchOrRandom = 3
        assertTextNotEmpty()
    }
    
    @IBAction func minAttackSearch(_ sender: Any) {
        searchOrRandom = 5
        assertTextNotEmpty()
    }
    
    @IBAction func minHealthSearch(_ sender: Any) {
        searchOrRandom = 6
        assertTextNotEmpty()
    }
    
    @IBAction func minDefenseSearch(_ sender: Any) {
        searchOrRandom = 7
        assertTextNotEmpty()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        optionsView.isHidden = true
        normalView.isHidden = false
        categoryView.isHidden = true
        typeView.isHidden = true
    }
    
    func assertTextNotEmpty() {
        if textfield.text == "" {
            presentAlert()
        } else {
            textToSearch = textfield.text ?? ""
            self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
        }
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "No input", message: "Please enter a valid input to search", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
