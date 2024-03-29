//
//  RacesResponse.swift
//  RpgDice
//
//  Created by Henrique Abreu on 16/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

struct RacesResponse: Codable, Category{
    let index: String
    let name: String
    let speed: Float
    let abilityBonuses: [AbilityBonus]
    let alignment: String
    let age: String
    let size: String
    let sizeDescription: String
    let startingProficiencies: [Proficiency]
    let languages: [[String : String]]
    let languagesDescription: String
    let traits: [[String : String]]
    let traitOptions: Choices?
    
    enum CodingKeys: String, CodingKey{
        case index
        case name
        case speed
        case abilityBonuses = "ability_bonuses"
        case alignment
        case age
        case size
        case sizeDescription = "size_description"
        case startingProficiencies = "starting_proficiencies"
        case languages
        case languagesDescription = "language_desc"
        case traits
        case traitOptions = "trait_options"
    }
    
}

struct AbilityBonus: Codable{
    let abilityScore: [String : String]
    let bonus: Int
    
    enum CodingKeys: String, CodingKey{
        case abilityScore = "ability_score"
        case bonus
    }
}

