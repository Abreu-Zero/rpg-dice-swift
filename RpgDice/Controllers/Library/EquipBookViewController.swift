//
//  EquipBookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class EquipBookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return equips.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return equips[row].name
    }
    

    @IBOutlet weak var picker: UIPickerView!
    
    var category: EquipmentResponse?
    var equips: [Equipment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        for equip in category!.equipment{
            equips.append(equip)
        }
        
        picker.reloadAllComponents()
    }

}
