//
//  LibraryViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 10/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //MARK: var lets and outlets
    
    @IBOutlet weak var picker: UIPickerView!
    
    var results: [Result] = []
    let linkedList = LinkedList()
    
    //MARK: pickerVIew funcs
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return linkedList.count()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return linkedList.index(index: row)?.title
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DndAPI.requestBase(endpoint: linkedList.index(index: row)!.value) { (result, error) in
            guard let result = result else{
                return
            }
            print(result)
        }
    }
    
    //MARK: tableView funcs
    
    //MARK: viewDid funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        picker.reloadAllComponents()
        
        //Populating the LinkedList to use in the pickerView
        let nodeAbility = Node(value: DndAPI.Endpoint.abilityScores, title: "Abilities")
        linkedList.append(node: nodeAbility)
        let nodeClasses = Node(value: DndAPI.Endpoint.classes, title: "Classes")
        linkedList.append(node: nodeClasses)
        let nodeEquip = Node(value: DndAPI.Endpoint.equipment, title: "Equiment")
        linkedList.append(node: nodeEquip)
        let nodeMonsters = Node(value: DndAPI.Endpoint.monsters, title: "Monsters")
        linkedList.append(node: nodeMonsters)
        let nodeRaces = Node(value: DndAPI.Endpoint.races, title: "Races")
        linkedList.append(node: nodeRaces)
        let nodeSpells = Node(value: DndAPI.Endpoint.spells, title: "Spells")
        linkedList.append(node: nodeSpells)
        
        DndAPI.requestBase(endpoint: .monsters) { (result, error) in
                    guard let result = result else{
                        print(error!)
                        return
                    }
            print(result)
        }
    }
        
        //TODO: Dropdown menu works
        //TODO: add activityIndicator
        //TODO: UI responds to requests

    
}
