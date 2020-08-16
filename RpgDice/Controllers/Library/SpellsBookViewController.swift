//
//  SpellsBookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 16/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class SpellsBookViewController: UIViewController {
    
    var spell: SpellsResponse?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var healDamageLabel: UILabel!
    @IBOutlet weak var classesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let spell = spell else{return}
        
        nameLabel.text = "\n\(spell.name)"
        descLabel.text = "Description: \(spell.description[0])"
        
        rangeLabel.text = "Range: \(spell.range)"
        
        if let material = spell.material{
            materialLabel.text = "Material: \(material)"
        }else{
            materialLabel.text = ""
        }
        
        durationLabel.text = "Duration: \(spell.duration) \n\nCasting Time: \(spell.castingTime)"
        
        classesLabel.text = "Classes: "
        if spell.classes.count == 0{
            classesLabel.text! += "\nnone"
        }else{
            for cl in spell.classes{
                classesLabel.text! += "\n\(cl["name"]!)"
            }
        }
        
        if let heal = spell.heal{
            healDamageLabel.text = "Heal: "
            for i in (0 ... 20){
                for (key, value) in heal{
                    if String(i) == key{
                        healDamageLabel.text! += "\nLVL \(key): \(value)"
                    }
                }
            }
        } else if let damage = spell.damage{
            healDamageLabel.text = "Damage: \(damage.damageType["name"]!)"
            var type: [String: String] = [:]
            if let damageSlot = damage.damageSlot{
                type = damageSlot
            } else{
                type = spell.damage!.damageCharacter!
            }
            for i in (0 ... 20){
                for (key, value) in type{
                    if String(i) == key{
                        healDamageLabel.text! += "\nLVL \(key): \(value)"
                    }
                }
            }
        } else{
            healDamageLabel.text = ""
        }
    }
    
}
