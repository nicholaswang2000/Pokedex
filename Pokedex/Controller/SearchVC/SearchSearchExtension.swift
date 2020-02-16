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
        if let navController = self.navigationController {
            Pokerman.setPokemon(randomPokemonList)
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func listAllPokemon(_ sender: Any) {
        if let navController = self.navigationController {
            Pokerman.setPokemon(PokemonGenerator.getPokemonArray())
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func searchTime(_ sender: Any) {
        let minAtt = Int(minattTF.text ?? "0") ?? 0
        let maxAtt = Int(maxattTF.text ?? "9999") ?? 9999
        let minDef = Int(mindefTF.text ?? "0") ?? 0
        let maxDef = Int(maxdefTF.text ?? "9999") ?? 9999
        let minH = Int(minhTF.text ?? "0") ?? 0
        let maxH = Int(maxhTF.text ?? "9999") ?? 9999
        
        if minAtt > maxAtt {
            presentAlert()
            return
        } else if minDef > maxDef {
            presentAlert()
            return
        } else if minH > maxH {
            presentAlert()
            return
        }
        var filterPokerman: [Pokemon] = PokemonGenerator.getPokemonArray()
        
        // First filter types
        if typesPressed.values.contains(true) {
            var typeArr: [PokeType] = []
            for (type, bol) in typesPressed {
                if bol {
                    typeArr.append(type)
                }
            }
            filterPokerman = PokemonHelpers.getTypeSearchArray(typeArr, filterPokerman)
        }
        // Then filter name / number
        if nameTextfield.text != "" {
            filterPokerman = PokemonHelpers.getNameSearchArray(nameTextfield.text!, filterPokerman)
        }
        if numberTextfield.text != "" {
            filterPokerman = PokemonHelpers.getNumberSearchArray(Int(numberTextfield.text!)!, filterPokerman)
        }
        
        // Lastly filter all ranges of values
        filterPokerman = PokemonHelpers.getAttackArray(minAtt, maxAtt, filterPokerman)
        filterPokerman = PokemonHelpers.getDefenseArray(minDef, maxDef, filterPokerman)
        filterPokerman = PokemonHelpers.getHealthArray(minH, maxH, filterPokerman)
        
        if let navController = self.navigationController {
            Pokerman.setPokemon(filterPokerman)
            navController.popViewController(animated: true)
        }
    }

    func presentAlert() {
        let alert = UIAlertController(title: "No input", message: "Please enter a valid input to search", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
