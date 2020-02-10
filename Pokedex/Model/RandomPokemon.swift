//
//  RandomPokemon.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation

class RandomPokemon {
    
    static func generateRandomPokemon(total total: Int) -> [Pokemon] {
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
    
}
