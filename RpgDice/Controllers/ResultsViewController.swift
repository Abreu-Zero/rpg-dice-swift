//
//  ResultsViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 09/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(rollResult!)
    }
    

    @IBOutlet weak var resultLabel: UILabel!
    
    var rollResult: Int?

}
