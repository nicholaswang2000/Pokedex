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
    
    static func getNameSearchArray(_ name: String, _ arr: [Pokemon]) -> [Pokemon] {
        for pokerman in arr {
            if pokerman.name.lowercased().trimmingCharacters(in: .whitespaces) == name.lowercased().trimmingCharacters(in: .whitespaces) {
                return [pokerman]
            }
        }
        return []
    }
    
    static func getNumberSearchArray(_ id: Int, _ arr: [Pokemon]) -> [Pokemon] {
        for pokerman in arr {
            if id == pokerman.id {
                return [pokerman]
            }
        }
        return []
    }
    
    static func getAttackArray(_ minAttack: Int, _ maxAttack: Int, _ arr: [Pokemon]) -> [Pokemon] {
        var pokemonArr: [Pokemon] = []
        for pokerman in arr {
            if pokerman.attack <= maxAttack && pokerman.attack >= minAttack {
                pokemonArr.append(pokerman)
            }
        }
        return pokemonArr
    }
    
    static func getDefenseArray(_ minDefense: Int, _ maxDefense: Int, _ arr: [Pokemon]) -> [Pokemon] {
        var pokemonArr: [Pokemon] = []
        for pokerman in arr {
            if pokerman.defense <= maxDefense && pokerman.defense >= minDefense {
                pokemonArr.append(pokerman)
            }
        }
        return pokemonArr
    }
    
    static func getHealthArray(_ minHealth: Int, _ maxHealth: Int, _ arr: [Pokemon]) -> [Pokemon] {
        var pokemonArr: [Pokemon] = []
        for pokerman in arr {
            if pokerman.health <= maxHealth && pokerman.health >= minHealth {
                pokemonArr.append(pokerman)
            }
        }
        return pokemonArr
    }
    
    static func getTypeSearchArray(_ typeArr: [PokeType], _ arr: [Pokemon]) -> [Pokemon] {
        var pokemonArr: [Pokemon] = []
        for pokerman in arr {
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
    
    static func getArrayFromSearchBar(_ str: String, _ arr: [Pokemon]) -> [Pokemon] {
        var pokemonArr: [Pokemon] = []
        for pokerman in arr {
            if pokerman.name.starts(with: str) {
                pokemonArr.append(pokerman)
            }
        }
        return pokemonArr
    }
    
}
