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
        
        strLabel.text = "STR: \(monster.strength)"
        dexLabel.text = "DEX: \(monster.dexterity)"
        conLabel.text = "CON: \(monster.constitution)"
        intLabel.text = "INT: \(monster.intelligence)"
        wisLabel.text = "WIS: \(monster.wisdom)"
        chaLabel.text = "CHA: \(monster.charisma)"
        
        proficienciesLabel.text = checkProficiencies(monster: monster)
        
        checkResistance(label: damageVulnerabilitiesLabel, name: "\nDamage Vulnerabilities:", resistance: monster.damageVulnerabilities)
        checkResistance(label: damageResistencesLabel, name: "Damage Resistance:", resistance: monster.damageResistences)
        checkResistance(label: damageImmunitiesLabel, name: "Damage Immunities:", resistance:  monster.damageImmunities)
        
        conditionsImmunitiesLabel.text = "Condition Immunities:"
        
        if monster.conditionImmunities.count == 0{
            conditionsImmunitiesLabel.text! += "\nnone"
        }else{
            for cond in monster.conditionImmunities{
                 conditionsImmunitiesLabel.text! += "\n\(cond["name"]!)\n"
            }
        }
        if monster.languages.count == 0{
            languagesLabel.text = ""
        }else{
            languagesLabel.text = "\nLanguages: \(monster.languages)"

        }
        challengeRatingLabel.text = "\nChallenge Rating: \(Int(monster.challangeRating))"
        
        specialAbilitiesLabel.text = checkSpecialAbilities(monster: monster)
        
        actionsLabel.text = ""
        if let actions = monster.actions{
            checkActions(label: actionsLabel, name: "ACTIONS: ", actions: actions)
        }
        
        legendaryActionsLabel.text = ""
        if let lActions = monster.legendaryActions{
            checkActions(label: legendaryActionsLabel, name: "\n\nLEGENDARY ACTIONS: ", actions: lActions)
        }
   
    }
    
    func checkResistance(label: UILabel, name: String, resistance: [String]){
        label.text = name
        if resistance.count == 0{
            label.text! += "\nnone"
        }
        
        for r in resistance{
            label.text! += "\n\(r)"
            label.numberOfLines += 1
        }
    }
    
    func checkActions(label: UILabel, name: String, actions: [Action]){
        label.text = name

        if actions.count == 0{
            label.text! += "\nnone"
        } else{
            for action in actions{
                label.text! += "\n\n\(action.name)\n\nDescription: \(action.description)\n"
                if action.attackBonus != nil {
                    label.text! += "-ATK Bonus: \(action.attackBonus!)\n"
                }
                if action.damage != nil {
                    for d in action.damage!{
                        label.text! += "-Damage: \(d.damageDice!)\n"
                        label.text! += "-Type: \(d.damageType!["name"]!)"
                        label.numberOfLines += 10
                    }
                    
                }
            }
        }
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

        
        
    
    

}
