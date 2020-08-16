//
//  MonsterResponse.swift
//  RpgDice
//
//  Created by Henrique Abreu on 15/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

struct MonsterResponse: Codable, Category{
    
    let id: String
    let index: String
    let name: String
    let size: String
    let monsterType: String
    let subtype: String?
    let alignment: String
    let armorClass: Int
    let hitPoints: Int
    let hitDice: String
    let speed: Speed
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let intelligence: Int
    let wisdom: Int
    let charisma: Int
    let proficiencies: [Proficiency]?
    let damageVulnerabilities: [String]
    let damageResistences: [String]
    let damageImmunities: [String]
    let conditionImmunities: [[String : String]]
    let languages: String
    let challangeRating: Float
    let specialAbilities: [SpecialAbilities]?
    let actions : [Action]?
    let legendaryActions: [Action]?
    
    enum CodingKeys: String, CodingKey{
        
        case id = "_id"
        case index
        case name
        case size
        case monsterType = "type"
        case subtype
        case alignment
        case armorClass = "armor_class"
        case hitPoints = "hit_points"
        case hitDice = "hit_dice"
        case speed
        case strength
        case dexterity
        case constitution
        case intelligence
        case wisdom
        case charisma
        case proficiencies
        case damageVulnerabilities = "damage_vulnerabilities"
        case damageResistences = "damage_resistances"
        case damageImmunities = "damage_immunities"
        case conditionImmunities = "condition_immunities"
        case languages
        case challangeRating = "challenge_rating"
        case specialAbilities = "special_abilities"
        case actions
        case legendaryActions = "legendary_actions"
    }
}

struct Speed: Codable{
    let walk: String?
    let swim: String?
    let fly: String?
}

struct Proficiency: Codable{
    let name: String
    let url: String
    let value: Int?
}

struct SpecialAbilities: Codable{
    let name: String
    let desc: String
}

struct DC: Codable{
    let dcType: [String : String]
    let dcValue: Int
    let successType: String
    
    enum CodingKeys: String, CodingKey{
        case dcType = "dc_type"
        case dcValue = "dc_value"
        case successType = "success_type"
    }
}

struct Action: Codable{
    let name: String
    let description: String
    let dc: DC?
    let attackBonus: Int?
    let damage: [Damage]?
    
    enum CodingKeys: String, CodingKey{
        case name
        case description = "desc"
        case dc
        case attackBonus = "attack_bonus"
        case damage
    }
}

