//
//  EquipmentResponse.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

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
