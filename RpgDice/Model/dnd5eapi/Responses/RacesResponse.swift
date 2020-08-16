//
//  RacesResponse.swift
//  RpgDice
//
//  Created by Henrique Abreu on 16/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

struct RacesResponse: Codable, Category{
    let id: String
    let index: String
    let name: String
    let speed: Float
    let abilityBonuses: [AbilityBonus]
    let alignment: String
    let age: String
    let size: String
    let sizeDescription: String
    let startingProficiencies: [Proficiency]?
    let languages: [[String : String]]
    let languagesDescription: String
    let traits: [[String : String]]
    let traitOptions: Choices?
    let subraces: [[String : String]]?
    
    enum CodingKeys: String, CodingKey{
        case id = "_id"
        case index
        case name
        case speed
        case abilityBonuses = "ability_bonuses"
        case alignment
        case age
        case size
        case sizeDescription = "size_description"
        case startingProficiencies = "starting_ proficiencies"
        case languages
        case languagesDescription = "language_desc"
        case traits
        case traitOptions = "trait_options"
        case subraces
    }
    
}

struct AbilityBonus: Codable{
    let name: String
    let url: String
    let bonus: Int
}

