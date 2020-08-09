//
//  FirstViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 09/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var dataController: DataController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLibrary"{
            
        } else {
            let destVC = segue.destination as! DicesViewController
            destVC.dataController = dataController
        }
    }

    
}
