//
//  Pokerman.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/15/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation

class Pokerman {
    
    private static var storedPokemon: [Pokemon] = PokemonGenerator.getPokemonArray()
    
    static func setPokemon(_ pokerArray:[Pokemon]) {
        storedPokemon = pokerArray
    }
    
    static func getPokemon() -> [Pokemon] {
        return storedPokemon
    }
    
}
