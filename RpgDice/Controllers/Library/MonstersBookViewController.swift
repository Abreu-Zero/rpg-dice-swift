//
//  MonstersBookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 15/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class MonstersBookViewController: UIViewController {

    
    //MAR: my favourite labels
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var armorClassLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var hitDiceLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var strLabel: UILabel!
    @IBOutlet weak var dexLabel: UILabel!
    @IBOutlet weak var conLabel: UILabel!
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var wisLabel: UILabel!
    @IBOutlet weak var chaLabel: UILabel!
    @IBOutlet weak var proficienciesLabel: UILabel!
    @IBOutlet weak var damageVulnerabilitiesLabel: UILabel!
    @IBOutlet weak var damageResistencesLabel: UILabel!
    @IBOutlet weak var damageImmunitiesLabel: UILabel!
    @IBOutlet weak var conditionsImmunitiesLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var challengeRatingLabel: UILabel!
    @IBOutlet weak var specialAbilitiesLabel: UILabel!
    @IBOutlet weak var actionsLabel: UILabel!
    @IBOutlet weak var legendaryActionsLabel: UILabel!
    
    //MARK: Monster
    
    var monster: MonsterResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Name: \(monster!.name)"
        sizeLabel.text = "Size: \(monster!.size)"
        typeLabel.text = "Type: \(monster!.monsterType)"
        alignmentLabel.text = "Alignment: \(monster!.alignment)"
        armorClassLabel.text = "Armor Class: \(monster!.armorClass)"
        hpLabel.text = "HP: \(monster!.hitPoints)"
        hitDiceLabel.text = "Hit Dice: \(monster!.hitDice)"
        //TODO: Speed
        speedLabel.text = "Speed: \n Swim: \(monster?.speed.swim)\nWalk: \(monster?.speed.walk)\nFly: \(monster?.speed.fly)"
        strLabel.text = "STR: \(monster!.strength)"
        dexLabel.text = "DEX: \(monster!.dexterity)"
        conLabel.text = "CON: \(monster!.constitution)"
        intLabel.text = "INT: \(monster!.intelligence)"
        wisLabel.text = "WIS: \(monster!.wisdom)"
        chaLabel.text = "CHA: \(monster!.charisma)"
        
        if let proficiency = monster?.proficiencies{
            proficienciesLabel.text = ""
            for p in proficiency{
                proficienciesLabel.text! += "\(p.name) Value: \(p.value)\n"
            }
        }
        
        checkResistance(label: damageVulnerabilitiesLabel, resistance: monster!.damageVulnerabilities)
        checkResistance(label: damageResistencesLabel, resistance: monster!.damageResistences)
        checkResistance(label: damageImmunitiesLabel, resistance:  monster!.damageImmunities)
        
        conditionsImmunitiesLabel.text = ""
        
        if monster?.conditionImmunities.count == 0{
            conditionsImmunitiesLabel.text = "none"
        }else{
            for cond in monster!.conditionImmunities{
                 conditionsImmunitiesLabel.text! += "\(cond["name"]!)\n"
            }
        }
        
        languagesLabel.text = "Languages: \(monster!.languages)"
        challengeRatingLabel.text = "Challenge Rating: \(monster!.challangeRating)"
        
        if monster?.specialAbilities?.count == 0{
            specialAbilitiesLabel.text! += "none"

        } else{
            specialAbilitiesLabel.text = ""
            for special in monster!.specialAbilities!{
                specialAbilitiesLabel.text! += "\(special.name)\nDescription: \(special.desc)\n"
            }
        }
        
        checkActions(label: actionsLabel, actions: monster!.actions!)
        checkActions(label: legendaryActionsLabel, actions: monster!.legendaryActions!)
        
        
        
        
    }
    
    func checkResistance(label: UILabel, resistance: [String]){
        label.text = ""
        if resistance.count == 0{
            label.text = "none"
        }
        
        for r in resistance{
            label.text! += "\(r)\n"
        }
    }
    
    func checkActions(label: UILabel, actions: [Action]){
        if actions.count == 0{
            label.text = "none"
        } else{
            label.text = ""
            for action in actions{
                label.text! += "\(action.name)\nDescription: \(action.description)\n"
                if action.attackBonus != nil {
                    label.text! += "ATK Bonus: \(action.attackBonus!)\n"
                }
                if action.damage != nil {
                    label.text! += "Damage: \(action.damage!)\n"
                }
            }
        }
    }

        
        
    
    

}
