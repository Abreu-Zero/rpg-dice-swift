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

struct Item: Codable{
    let id: String
    let index: String
    let name: String
    let equipment: [String : String]
    let tool: String
    let cost: ItemCost
    let weight: Int
    let itemDescription: [String]
    let url: String
        
    enum CodingKeys: String, CodingKey{
            
        case id = "_id"
        case index
        case name
        case equipment = "equipment_category"
        case tool = "tool_category"
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
