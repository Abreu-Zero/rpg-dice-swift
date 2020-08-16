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
    
    var race: RacesResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = race?.name
        //speedLabel.text = race?.speed
        alignmentLabel.text = race?.alignment
        abiBonusLabel.text = race?.abilityBonuses[0].name
        ageLabel.text = race?.age
        sizeLabel.text = race?.size
        startProfLabel.text = race?.startingProficiencies?[0].name

    }

}
