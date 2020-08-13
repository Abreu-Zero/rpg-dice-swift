//
//  EquipBookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

//TODO: find a way to filter the requests and create a responsive UI accordingly

class EquipBookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
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
    
    //MARK: picker funcs
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return equips.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return equips[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DndAPI.equipRequest(url: equips[row].url) { (item, error) in
            guard let item = item else{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.nameLabel.text = "Name: \(item.name)"
                self.costLabel.text = "Cost: \(String(item.cost.quantity))\(item.cost.unit)"
                self.descLabel.text = "Description: \(item.itemDescription?[0] ?? "No Description")"
            }
            
        }
    }



}
