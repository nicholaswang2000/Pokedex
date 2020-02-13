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
        for pokerman in allPokemon {
            if pokerman.name.lowercased().trimmingCharacters(in: .whitespaces) == name.lowercased().trimmingCharacters(in: .whitespaces) {
                return [pokerman]
            }
        }
        return []
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
    
    static func getMinAttackArray(_ minAttack: Int) -> [Pokemon] {
        let allPokemon = PokemonGenerator.getPokemonArray()
        var pokemonArr: [Pokemon] = []
        for pokerman in allPokemon {
            if minAttack <= pokerman.attack {
                pokemonArr.append(pokerman)
            }
        }
        return pokemonArr
    }
    
    static func getMinHealthArray(_ minHealth: Int) -> [Pokemon] {
        let allPokemon = PokemonGenerator.getPokemonArray()
        var pokemonArr: [Pokemon] = []
        for pokerman in allPokemon {
            if minHealth <= pokerman.health {
                pokemonArr.append(pokerman)
            }
        }
        return pokemonArr
    }
    
    static func getMinDefenseArray(_ minDefense: Int) -> [Pokemon] {
        let allPokemon = PokemonGenerator.getPokemonArray()
        var pokemonArr: [Pokemon] = []
        for pokerman in allPokemon {
            if minDefense <= pokerman.defense {
                pokemonArr.append(pokerman)
            }
        }
        return pokemonArr
    }
    
    static func getTypeSearchArray(_ typeArr: [PokeType]) -> [Pokemon] {
        let allPokemon = PokemonGenerator.getPokemonArray()
        var pokemonArr: [Pokemon] = []
        for pokerman in allPokemon {
            let currTypes = pokerman.types
            for ct in currTypes {
                if typeArr.contains(ct) {
                    pokemonArr.append(pokerman)
                    continue
                }
            }
        }
        return pokemonArr
    }
    
    static func getPokeTypeArray(_ typeDict: [PokeType: Bool]) -> [PokeType] {
        var typeArr:[PokeType] = []
        for type in typeDict {
            if type.value {
                typeArr.append(type.key)
            }
        }
        return typeArr
    }
    
    static func getArrayFromSearchBar(_ str: String) -> [Pokemon] {
        let allPokemon = PokemonGenerator.getPokemonArray()
        var pokemonArr: [Pokemon] = []
        for pokerman in allPokemon {
            if pokerman.name.starts(with: str) {
                pokemonArr.append(pokerman)
            }
        }
        return pokemonArr
    }
    
}
