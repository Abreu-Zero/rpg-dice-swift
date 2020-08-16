//
//  SpellsReponse.swift
//  RpgDice
//
//  Created by Henrique Abreu on 16/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

struct SpellsResponse: Codable, Category{
    let name: String
    let description: [String]
    let range: String
    let material: String?
    let duration: String
    let castingTime: String
    let level: Int
    let attackType: String?
    let damage: Damage?
    let heal: [String : String]?
    let school: [String : String]
    let classes: [[String : String]]
    
    enum CodingKeys: String, CodingKey{
        case name
        case description = "desc"
        case range
        case material
        case duration
        case castingTime = "casting_time"
        case level
        case attackType = "attack_type"
        case damage
        case heal = "heal_at_slot_level"
        case school
        case classes
    }
    
}
