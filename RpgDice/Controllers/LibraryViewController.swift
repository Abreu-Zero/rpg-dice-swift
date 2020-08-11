//
//  LibraryViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 10/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var picker: UIPickerView!
    
    let endpoints: [String] = ["abilityScores", "classes", "equipment", "monsters", "races", "spells"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return endpoints.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return endpoints[row]
       }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        picker.reloadAllComponents()
        }
        
        //TODO: Dropdown menu works
        //TODO: add activityIndicator
        //TODO: UI responds to requests

    
}
