//
//  Pokemon.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2020 MDB. All rights reserved.
//  Updated by ANMOL PARANDE on 01/25/20

import Foundation

/* Note 1:
   There are 18 different types of Pokemon, and a single Pokemon can inherit multiple types:
        Bug, Grass, Dark, Ground, Dragon, Ice, Electric, Normal, Fairy,
        Poison, Fighting, Psychic, Fire, Rock, Flying, Steel, Ghost, Water
*/

enum PokeType:String {
    case Bug
    case Grass
    case Dark
    case Ground
    case Dragon
    case Ice
    case Electric
    case Normal
    case Fairy
    case Poison
    case Fighting
    case Psychic
    case Fire
    case Rock
    case Flying
    case Steel
    case Ghost
    case Water
    case Unknown
}

class Pokemon: Decodable {
    /* Note 2:
       The image for each Pokemon is not provided, but a URL is. You should look up how to get an image from it's URL.
    */
     
    let name: String
    let id: Int
    let attack: Int
    let defense: Int
    let health: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
    let total: Int
    let types: [PokeType]
    let imageUrl: String
    let largeUrl: String
    let animatedUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "national_number"
        case health = "hp"
        case images = "sprites"
        case spAtk = "sp_atk"
        case spDef = "sp_def"
        
        case name, total, speed, attack, defense, type, evolution
    }
    
    enum ImageKeys: String, CodingKey {
        case normal
        case large
        case animated
    }
    
    enum EvolutionKeys: String, CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        let name = try valueContainer.decode(String.self, forKey: .name)
        
        
        if let evolutionContainer = try? valueContainer.nestedContainer(keyedBy: EvolutionKeys.self, forKey: .evolution), let evolutionName = try? evolutionContainer.decode(String.self, forKey: .name), evolutionName != "" {
            self.name = evolutionName
        } else {
            self.name = name
        }
        
        self.id = Int(try valueContainer.decode(String.self, forKey: .id)) ?? 0
        self.attack = try valueContainer.decode(Int.self, forKey: .attack)
        self.defense = try valueContainer.decode(Int.self, forKey: .defense)
        self.health = try valueContainer.decode(Int.self, forKey: .health)
        self.specialAttack = try valueContainer.decode(Int.self, forKey: .spAtk)
        self.specialDefense = try valueContainer.decode(Int.self, forKey: .spDef)
        self.speed = try valueContainer.decode(Int.self, forKey: .speed)
        self.total = try valueContainer.decode(Int.self, forKey: .total)
        
        let stringTypes = try valueContainer.decode([String].self, forKey: .type)
        
        self.types = stringTypes.map({ (type) -> PokeType in
            guard let type = PokeType(rawValue: type) else { return .Unknown}
            return type
        })
        
        let imageContainer = try valueContainer.nestedContainer(keyedBy: ImageKeys.self, forKey: .images)
        
        self.largeUrl = try imageContainer.decode(String.self, forKey: .large)
        self.animatedUrl = try imageContainer.decode(String.self, forKey: .animated)
        self.imageUrl = try imageContainer.decode(String.self, forKey: .normal)
    }
    
    static func getTypeString(_ type: PokeType) -> String {
        switch type {
        case .Bug:
            return "Bug"
        case .Grass:
            return "Grass"
        case .Dark:
            return "Dark"
        case .Ground:
            return "Ground"
        case .Dragon:
            return "Dragon"
        case .Ice:
            return "Ice"
        case .Electric:
            return "Electric"
        case .Normal:
            return "Normal"
        case .Fairy:
            return "Fairy"
        case .Poison:
            return "Poison"
        case .Fighting:
            return "Fighting"
        case .Psychic:
            return "Psychic"
        case .Fire:
            return "Fire"
        case .Rock:
            return "Rock"
        case .Flying:
            return "Flying"
        case .Steel:
            return "Steel"
        case .Ghost:
            return "Ghost"
        case .Water:
            return "Water"
        case .Unknown:
            return "Unknown"
        }
    }
    
    func getTypes() -> String {
        
        let types:[PokeType] = self.types
        var typeStr = ""
        for type in types {
            typeStr += Pokemon.getTypeString(type) + ", "
        }
        typeStr.remove(at: typeStr.index(before: typeStr.endIndex))
        typeStr.remove(at: typeStr.index(before: typeStr.endIndex))
        
        return typeStr
    }
}
