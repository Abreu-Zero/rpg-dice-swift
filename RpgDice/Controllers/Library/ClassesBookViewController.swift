//
//  ClassesBookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class ClassesBookViewController: UIViewController {

    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var hitdieLabel: UILabel!
    @IBOutlet weak var pickProfLabel: UILabel!
    @IBOutlet weak var profChoicesLabel: UILabel!
    @IBOutlet weak var profLabel: UILabel!
    @IBOutlet weak var savingLabel: UILabel!

    var dndClass: ClassResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classNameLabel.text = dndClass?.name
        hitdieLabel.text = "hit die: \(dndClass!.hitDie)"
        pickProfLabel.text = "Proeficiency Choices: (\(dndClass!.proeficiencyChoices[0].choose))"
        
        profChoicesLabel.text = ""
        for p in dndClass!.proeficiencyChoices{
            for p in p.from{
                profChoicesLabel.text! += "\(p["name"]!)\n"
            }
        }
        
        profLabel.text = ""
        for p in dndClass!.proficiencies{
            profLabel.text! += "\(p["name"]!)\n"

        }
        
        savingLabel.text = ""
        for p in dndClass!.saving{
            savingLabel.text! += "\(p["name"]!)\n"

        }
    }
    

}
