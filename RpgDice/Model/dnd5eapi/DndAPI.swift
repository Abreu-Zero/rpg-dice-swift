//
//  DndAPI.swift
//  RpgDice
//
//  Created by Henrique Abreu on 10/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import Foundation

public class DndAPI{
    

    static let baseURL: String = "https://www.dnd5eapi.co"

    enum Endpoint{
        
        case abilityScores
        case classes
        case equipment
        case monsters
        case races
        case spells

        var url: URL{
            return URL(string: self.stringValue)!
        }
        var stringValue: String {
            switch self{
            case .abilityScores:
                return baseURL + "/api/ability-scores"
            case .classes:
                return baseURL + "/api/classes"
            case .equipment:
                return baseURL + "/api/equipment-categories"
            case .monsters:
                return baseURL + "/api/monsters"
            case .races:
                return baseURL + "/api/races"
            case .spells:
                return baseURL + "/api/spells"
            }
        }
    }
    
    class func requestBase(endpoint: Endpoint, completionHandler: @escaping (BaseResult?, Error?) -> Void){
        
        let endURL = (endpoint.url)
        print(endURL)
        let task = URLSession.shared.dataTask(with: endURL) { (data, response, error) in
            
            guard let data = data else {
                print("ERROR: no data")
                completionHandler(nil, error)
                return
            }
            print(data)
            let decoder = JSONDecoder()
            do
            {
                let data = try decoder.decode(BaseResult.self, from: data)
                completionHandler(data, nil)
            }
            catch
            {
                print("ERROR: JSON not found")
                completionHandler(nil, error)
            }
        }
        task.resume()
    }
    
    class func categoryRequest(url: String, category: String, completionHandler: @escaping (Category?, Error?) -> Void){
        
        //TODO: create a switch to handle the 6 categories
        
        guard let url = URL(string: baseURL + url) else{return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("ERROR: no data")
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            do
            {
                let result: Category?
                switch category{
                case "Abilities":
                    result = try decoder.decode(AbilityScores.self, from: data)
                case "Classes":
                    result = try decoder.decode(ClassResponse.self, from: data)
                case "Equipment":
                    result = try decoder.decode(EquipmentResponse.self, from: data)
                case "Monsters":
                    result = try decoder.decode(MonsterResponse.self, from: data)
                default:
                    return
                }
                completionHandler(result, nil)

                
                
            }
            catch
            {
                print("ERROR: JSON not found")
                completionHandler(nil, error)
            }
        }
        task.resume()
    }
    
    class func equipRequest(url: String, completionHandler: @escaping (Item?, Error?) -> Void){
                
        guard let endURL = URL(string: self.baseURL + url) else {return}
        let task = URLSession.shared.dataTask(with: endURL){(data, response, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return}
            let decoder = JSONDecoder()
            do{
                let result = try decoder.decode(Item.self, from: data)
                completionHandler(result, nil)
            }catch{
                completionHandler(nil, error)
            }
            
        }
        task.resume()
    }
}
