//
//  BookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var ability: AbilityScores?
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ability?.fullName
        descLabel.text = "\(ability!.description[0])\n\n\((ability!.description[1]))"
    }
    

   
}
