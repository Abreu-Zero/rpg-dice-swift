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
        
        nameLabel.text = "\nName: \(monster!.name)"
        sizeLabel.text = "\nSize: \(monster!.size)"
        typeLabel.text = "\nType: \(monster!.monsterType)"
        alignmentLabel.text = "\nAlignment: \(monster!.alignment)"
        armorClassLabel.text = "\nArmor Class: \(monster!.armorClass)"
        hpLabel.text = "\nHP: \(monster!.hitPoints)"
        hitDiceLabel.text = "\nHit Dice: \(monster!.hitDice)"
        
        speedLabel.text = "\nSpeed: "
        if let walk = monster?.speed.walk{
            speedLabel.text! += "\nWalk: \(walk)"
        }
        if let swim = monster?.speed.swim{
            speedLabel.text! += "\nSwim: \(swim)"
        }
        if let fly = monster?.speed.fly{
            speedLabel.text! += "\nFly: \(fly)"
        }
        speedLabel.text! += "\n"
        
        strLabel.text = "STR: \(monster!.strength)"
        dexLabel.text = "DEX: \(monster!.dexterity)"
        conLabel.text = "CON: \(monster!.constitution)"
        intLabel.text = "INT: \(monster!.intelligence)"
        wisLabel.text = "WIS: \(monster!.wisdom)"
        chaLabel.text = "CHA: \(monster!.charisma)"
        
        if let proficiency = monster?.proficiencies{
            proficienciesLabel.text = "Proeficiencies:\n"
            for p in proficiency{
                proficienciesLabel.text! += "\n\(p.name) Value: \(p.value)\n"
                proficienciesLabel.numberOfLines += 2
            }
        }
        
        checkResistance(label: damageVulnerabilitiesLabel, name: "Damage Vulnerabilities:", resistance: monster!.damageVulnerabilities)
        checkResistance(label: damageResistencesLabel, name: "Damage Resistance:", resistance: monster!.damageResistences)
        checkResistance(label: damageImmunitiesLabel, name: "Damage Immunities:", resistance:  monster!.damageImmunities)
        
        conditionsImmunitiesLabel.text = "Condition Immunities:"
        
        if monster?.conditionImmunities.count == 0{
            conditionsImmunitiesLabel.text! += "\nnone"
        }else{
            for cond in monster!.conditionImmunities{
                 conditionsImmunitiesLabel.text! += "\(cond["name"]!)\n"
            }
        }
        
        languagesLabel.text = "\nLanguages: \(monster!.languages)"
        challengeRatingLabel.text = "Challenge Rating: \(Int(monster!.challangeRating))"
        
        specialAbilitiesLabel.text = "SPECIAL ABILITIES:"
        
        if monster?.specialAbilities?.count == 0{
            specialAbilitiesLabel.text! += "\nnone"
        } else{
            for special in monster!.specialAbilities!{
                specialAbilitiesLabel.text! += "\n\n\(special.name)\n\nDescription: \(special.desc)\n"
                specialAbilitiesLabel.numberOfLines += 10
            }
        }
        if let actions = monster?.actions{
            checkActions(label: actionsLabel, name: "ACTIONS: ", actions: actions)

        } else {
            actionsLabel.text = ""
        }
        if let lActions = monster?.legendaryActions{
            checkActions(label: legendaryActionsLabel, name: "LEGENDARY ACTIONS: ", actions: lActions)

        }else{
            legendaryActionsLabel.text = ""
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
                    label.text! += "*ATK Bonus: \(action.attackBonus!)\n"
                }
                if action.damage != nil {
                    for d in action.damage!{
                        label.text! += "*Damage: \(d.damageDice)\n"
                        label.text! += "*Type: \(d.damageType["name"]!)"
                        label.numberOfLines += 10
                    }
                    
                }
            }
        }
    }

        
        
    
    

}
