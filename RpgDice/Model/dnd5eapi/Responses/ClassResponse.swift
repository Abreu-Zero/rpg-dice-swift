//
//  ClassResponse.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

struct ClassResponse: Codable, Category{
    
    let index: String
    let name: String
    let hitDie: Int
    let proeficiencyChoices: [Choices]
    let proficiencies: [[String : String]]
    let saving : [[String : String]]
    let url: String
    
    enum CodingKeys: String, CodingKey{
        
        case index
        case name
        case hitDie = "hit_die"
        case proeficiencyChoices = "proficiency_choices"
        case proficiencies
        case saving = "saving_throws"
        case url
    }
}

struct Choices: Codable{
    
    let choose: Int
    let type: String
    let from: [[String : String]]
}
