//
//  EquipmentResponse.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

// TODO: create the remaining structs

struct EquipmentResponse: Codable, Category{
    
    let id: String
    let index: String
    let name: String
    let equipment: [Equipment]
    let url: String
        
    enum CodingKeys: String, CodingKey{
            
        case id = "_id"
        case index
        case name
        case equipment
        case url
        
    }
}

struct Equipment: Codable{
    
    let url: String
    let name: String
}

struct Item: Codable{
    let id: String
    let index: String
    let name: String
    let equipment: [String : String]
    
    // Armor exc
    let armor: String?
    let armorClass: ArmorClass?
    let strenghtMin: Int?
    let stealthDis: Bool?
    
    // Tool exc
    let tool: String?
    
    // Gear exc
    let gear: String?
    
    // Adventuring exc
    let contents: [ContentAdnv]?
    
    // Weapon exc
    let weaponCat: String?
    let weaponRange: String?
    let catRange: String?
    let damage: Damage?
    let range: [String : Float?]?
    
    let cost: ItemCost
    let weight: Float?
    let itemDescription: [String]?
    let url: String
        
    enum CodingKeys: String, CodingKey{
            
        case id = "_id"
        case index
        case name
        case equipment = "equipment_category"
        case armor = "armor_category"
        case armorClass = "armor_class"
        case strenghtMin = "str_minimum"
        case stealthDis = "stealth_disadvantage"
        case tool = "tool_category"
        case gear = "gear_category"
        case contents
        case weaponCat = "weapon_category"
        case weaponRange = "weapon_range"
        case catRange = "category_range"
        case damage
        case range
        case cost
        case weight
        case itemDescription = "desc"
        case url
        
    }
}

struct ItemCost: Codable{
    let quantity: Int
    let unit: String
}

struct ArmorClass: Codable{
    
    let base: Int
    let dexBonus: Bool
    let maxBonus: Int?
    
    enum CodingKeys: String, CodingKey{
            
        case base
        case dexBonus = "dex_bonus"
        case maxBonus = "max_bonus"
        
    }
}

struct ContentAdnv: Codable{
    let itemURL: String
    let quantity: Int
    
    enum CodingKeys: String, CodingKey{
        case itemURL = "item_url"
        case quantity
    }
}

struct Damage: Codable{
    let damageDice: String?
    let damageSlot: [String : String]?
    let damageCharacter: [String : String]?
    let damageType: [String : String]
    
    enum CodingKeys: String, CodingKey{
        case damageDice = "damage_dice"
        case damageSlot = "damage_at_slot_level"
        case damageCharacter = "damage_at_character_level"
        case damageType = "damage_type"
    }
}
