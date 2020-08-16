//
//  RacesBookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 16/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class RacesBookViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var abiBonusLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var startProfLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var traitLabel: UILabel!
    @IBOutlet weak var traitOptionLabel: UILabel!
    
    var race: RacesResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let race = race else{return}
        
        nameLabel.text = race.name
        speedLabel.text = "Speed: \(race.speed)"
        alignmentLabel.text = "Aligment: \(race.alignment)"
        
        abiBonusLabel.text = "Abilitiy Bonuses: "
        for a in race.abilityBonuses{
            abiBonusLabel.text! += "\n\(a.name): \(a.bonus)"
            abiBonusLabel.numberOfLines += 1
        }
        ageLabel.text = "Age: \(race.age)"
        sizeLabel.text = "\nSize: \(race.size)"
        sizeLabel.text! += "\n\n\(race.sizeDescription)"
        

        if race.startingProficiencies.count == 0{
            startProfLabel.text = ""
        }
        else{
            startProfLabel.text = "Starting Proficiencies: "
            for p in race.startingProficiencies{
                startProfLabel.text! += "\n\(p.name)"
            }
        }
        
        languagesLabel.text = "Languages: "
        for l in race.languages{
             languagesLabel.text! += "\n\(l["name"]!)"
            languagesLabel.numberOfLines += 2
        }
        languagesLabel.text! += "\n\n\(race.languagesDescription)"
        
        traitLabel.text = "Traits:"
        
        for trait in race.traits{
            traitLabel.numberOfLines += 1
            traitLabel.text! += "\n\(trait["name"]!)"
        }
        
        guard let choices = race.traitOptions else {
            traitOptionLabel.text = ""
            return}
        traitOptionLabel.text = "Trait Options: (\(choices.choose))"
        
        for c in choices.from{
            traitOptionLabel.text! += "\n\(c["name"]!)"
            traitOptionLabel.numberOfLines += 1
        }
        
        
        
        
    
    }

}
