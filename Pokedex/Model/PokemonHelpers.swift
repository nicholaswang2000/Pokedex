//
//  RandomPokemon.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation

class PokemonHelpers {
    
    static func generateRandomPokemon(_ total: Int) -> [Pokemon] {
        var randomPokemonArray: [Pokemon] = []
        var intsAlreadyUsed: [Int] = []
        let pokemonArray = PokemonGenerator.getPokemonArray()
        for _ in 1...total {
            var pIndex = Int.random(in: 0 ..< pokemonArray.count)
            while intsAlreadyUsed.contains(pIndex) {
                pIndex = Int.random(in: 0 ..< pokemonArray.count)
            }
            intsAlreadyUsed.append(pIndex)
            randomPokemonArray.append(pokemonArray[pIndex])
        }
        return randomPokemonArray
    }
    
    static func testWorking(_ randomPokemonArray:[Pokemon]) {
        for p in randomPokemonArray {
            print(p.id)
        }
        print(randomPokemonArray.count)
        let count = NSSet(array: randomPokemonArray).count
        print(count)
    }
    
    static func getPokemonFromID(_ id: Int) -> Pokemon {
        let allPokemon = PokemonGenerator.getPokemonArray()
        for pokerman in allPokemon {
            if pokerman.id == id {
                return pokerman
            }
        }
        return allPokemon[0]
    }
    
    static func getNameSearchArray(_ name: String) -> [Pokemon] {
        let allPokemon = PokemonGenerator.getPokemonArray()
        var searchedPokemon: [Pokemon] = []
        for pokerman in allPokemon {
            if pokerman.name.lowercased().contains(name) {
                searchedPokemon.append(pokerman)
            }
        }
        return searchedPokemon
    }
    
    static func getNumberSearchArray(_ id: Int) -> [Pokemon] {
        let allPokemon = PokemonGenerator.getPokemonArray()
        for pokerman in allPokemon {
            if id == pokerman.id {
                return [pokerman]
            }
        }
        return []
    }
    
}
