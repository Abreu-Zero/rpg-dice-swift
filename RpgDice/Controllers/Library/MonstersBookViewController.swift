//
//  MonstersBookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 15/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class MonstersBookViewController: UIViewController {

    
    //MARK: my favourite labels
    
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
        
        guard let monster = monster else{return}
        
        nameLabel.text = "\nName: \(monster.name)"
        sizeLabel.text = "\nSize: \(monster.size)"
        typeLabel.text = "\nType: \(monster.monsterType)"
        alignmentLabel.text = "\nAlignment: \(monster.alignment)"
        armorClassLabel.text = "\nArmor Class: \(monster.armorClass)"
        hpLabel.text = "\nHP: \(monster.hitPoints)"
        hitDiceLabel.text = "\nHit Dice: \(monster.hitDice)"
        
        speedLabel.text = checkSpeed(monster: monster)
        
        //Atributes
        strLabel.text = "STR: \(monster.strength)"
        dexLabel.text = "DEX: \(monster.dexterity)"
        conLabel.text = "CON: \(monster.constitution)"
        intLabel.text = "INT: \(monster.intelligence)"
        wisLabel.text = "WIS: \(monster.wisdom)"
        chaLabel.text = "CHA: \(monster.charisma)"
        
        proficienciesLabel.text = checkProficiencies(monster: monster)
        
        //Damage Modifiers
        damageVulnerabilitiesLabel.text = checkResistance(label: damageVulnerabilitiesLabel, name: "\nDamage Vulnerabilities:", resistance: monster.damageVulnerabilities)
        damageResistencesLabel.text = checkResistance(label: damageResistencesLabel, name: "Damage Resistance:",  resistance: monster.damageResistences)
        damageImmunitiesLabel.text = checkResistance(label: damageImmunitiesLabel, name: "Damage Immunities:", resistance:  monster.damageImmunities)
        
        conditionsImmunitiesLabel.text = checkConditionImunities(monster: monster)
        
        if monster.languages.count == 0{
            languagesLabel.text = ""
        }else{
            languagesLabel.text = "\nLanguages: \(monster.languages)"

        }
        challengeRatingLabel.text = "\nChallenge Rating: \(Int(monster.challangeRating))"
        
        specialAbilitiesLabel.text = checkSpecialAbilities(monster: monster)
        
        actionsLabel.text = ""
        if let actions = monster.actions{
            actionsLabel.text = checkActions(label: actionsLabel, name: "ACTIONS: ", actions: actions)
        }
        
        legendaryActionsLabel.text = ""
        if let lActions = monster.legendaryActions{
            legendaryActionsLabel.text = checkActions(label: legendaryActionsLabel, name: "\n\nLEGENDARY ACTIONS: ", actions: lActions)
        }
   
    }
    
    func checkResistance(label: UILabel, name: String, resistance: [String]) -> String{
        var resistanceString = name
        if resistance.count == 0{
            resistanceString += "\nnone"
        }
        
        for r in resistance{
            resistanceString += "\n\(r)"
            label.numberOfLines += 1
        }
        
        return resistanceString
    }
    
    func checkActions(label: UILabel, name: String, actions: [Action]) -> String{
        var returnString = name

        if actions.count == 0{
            returnString += "\nnone"
        } else{
            for action in actions{
                returnString += "\n\n\(action.name)\n\nDescription: \(action.description)\n"
                if action.attackBonus != nil {
                    returnString += "-ATK Bonus: \(action.attackBonus!)\n"
                }
                if action.damage != nil {
                    for d in action.damage!{
                        returnString += "-Damage: \(d.damageDice!)\n"
                        returnString += "-Type: \(d.damageType!["name"]!)"
                        label.numberOfLines += 10
                    }
                    
                }
            }
        }
        return returnString
    }
    
    func checkSpeed(monster: MonsterResponse) -> String{
        var speed = "\nSpeed: "
        
        if let walk = monster.speed.walk{
            speed += "\nWalk: \(walk)"
        }
        if let swim = monster.speed.swim{
            speed += "\nSwim: \(swim)"
        }
        if let fly = monster.speed.fly{
            speed += "\nFly: \(fly)"
        }
        speed += "\n"
        
        return speed
    }
    
    func checkProficiencies(monster: MonsterResponse) -> String{
        var prof: String = ""
        
        if let proficiency = monster.proficiencies{
            if proficiency.count > 0{
                prof = "\n\nProeficiencies:\n"
                for p in proficiency{
                    prof += "\n\(p.name) Value: \(p.value!)\n"
                    proficienciesLabel.numberOfLines += 2
                }
            }
        }
        
        return prof
    }
    
    func checkSpecialAbilities(monster: MonsterResponse) -> String{
        var specialAbilitiesString = ""
        
        guard let specialAbilities = monster.specialAbilities else{
            return specialAbilitiesString}
        specialAbilitiesString = "\nSPECIAL ABILITIES:"
        for special in specialAbilities{
            specialAbilitiesString += "\n\n\(special.name)\n\nDescription: \(special.desc)\n"
            specialAbilitiesLabel.numberOfLines += 10
        }
        
        return specialAbilitiesString
    }

    func checkConditionImunities(monster: MonsterResponse) -> String{
        var responseString = "Condition Immunities:"
        
        if monster.conditionImmunities.count == 0{
            responseString += "\nnone"
        }else{
            for cond in monster.conditionImmunities{
                 responseString += "\n\(cond["name"]!)\n"
            }
        }
        
        return responseString
    }
        
        
    
    

}
