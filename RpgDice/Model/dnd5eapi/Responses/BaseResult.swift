//
//  BaseResult.swift
//  RpgDice
//
//  Created by Henrique Abreu on 10/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

struct BaseResult: Codable{
    let count: Int
    let results: [Result]
}

struct Result: Codable{
    let index: String
    let name: String
    let url: String
}
