//
//  AbilityScores.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

struct AbilityScores: Codable{
    
    let id: String
    let index: String
    let name: String
    let fullName: String
    let description: [String]
    let skills: [[String : String]]
    let url: String
    
    enum CodingKeys: String, CodingKey{
        
        case id = "_id"
        case index
        case name
        case fullName = "full_name"
        case description = "desc"
        case skills
        case url
    }
}
