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
        speedLabel.text = "Speed: \n Swim: \(monster?.speed.swim)\nWalk: \(monster?.speed.walk)"
        strLabel.text = "STR: \(monster!.strength)"
        dexLabel.text = "DEX: \(monster!.dexterity)"
        conLabel.text = "CON: \(monster!.constitution)"
        intLabel.text = "INT: \(monster!.intelligence)"
        wisLabel.text = "WIS: \(monster!.wisdom)"
        chaLabel.text = "CHA: \(monster!.charisma)"
        
    }
    

}
