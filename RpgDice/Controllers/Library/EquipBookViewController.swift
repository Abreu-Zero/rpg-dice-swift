//
//  EquipBookViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 12/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit


//TODO: add activityIndicator for requests

class EquipBookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var category: EquipmentResponse?
    var equips: [Equipment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        for equip in category!.equipment{
            equips.append(equip)
        }
        //Hiding the optionals
        self.weightLabel.text = ""
        self.catLabel.text = ""
        self.classLabel.text = ""
        self.rangeLabel.text = ""
        self.damageLabel.text = ""
        self.typeLabel.text = ""
        
        populateTheStackView(row: 0)
        
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
        populateTheStackView(row: row)
    }
    
    func populateTheStackView(row: Int){
        self.activityIndicator.startAnimating()
        DndAPI.equipRequest(url: equips[row].url) { (item, error) in
            guard let item = item else{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                //Setting the base text
                self.nameLabel.text = "Name: \(item.name)"
                self.costLabel.text = "Cost: \(String(item.cost.quantity))\(item.cost.unit)"
                self.descLabel.text = "Description: \(item.itemDescription?[0] ?? "No Description")"
                
                //Using the optionals
                guard let weight = item.weight else{return}
                self.weightLabel.text = "Weight: \(weight)"

                guard let categoryA = item.armor else{
                    
                    //if not armour could be weapon
                    guard let categoryW = item.weaponCat else{return}
                    self.catLabel.text = "Category: \(categoryW)"
                    guard let range = item.weaponRange else{return}
                    self.rangeLabel.text = "Range: \(range)"
                    guard let type = item.damage?.damageType["name"] else {return}
                    self.typeLabel.text = "Type: \(type)"
                    guard let damage = item.damage?.damageDice else {return}
                    self.damageLabel.text = "Damage: \(damage)"
                    return
                }
                self.catLabel.text = "Category: \(categoryA)"
                
                guard let armourClass = item.armorClass else{return}
                self.classLabel.text = "Class: \(armourClass.base)"
            }
            
        }
    }
}
