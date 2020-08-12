//
//  LibraryViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 10/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //MARK: var lets and outlets
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    var results: [Result] = []
    let linkedList = LinkedList()
    var toSend: Category?
    var category: String = ""
    
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
        category = linkedList.index(index: row)!.title
        DndAPI.requestBase(endpoint: linkedList.index(index: row)!.value) { (result, error) in
            guard let result = result else{
                return
            }
            self.results = result.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: tableView funcs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "libraryCell")
        cell?.textLabel?.text = results[indexPath.row].name
        
        return cell!
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DndAPI.categoryRequest(url: results[indexPath.row].url, category: self.category) { (result, error) in
            guard let result = result else{
                print(error!)
                return
            }
            self.toSend = result
            DispatchQueue.main.async {
                switch self.category{
                case "Abilities":
                    self.performSegue(withIdentifier: "openBook", sender: self)
                case "Classes":
                    self.performSegue(withIdentifier: "openClass", sender: self)
                default:
                    self.performSegue(withIdentifier: "openBook", sender: self)
                }
            }
        }
    }
    
    //MARK: viewDid funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        picker.reloadAllComponents()
        tableView.delegate = self
        tableView.dataSource = self
        
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openBook"{
            let destination = segue.destination as! AbilitiesBookViewController
            destination.ability = self.toSend! as? AbilityScores
        }
        
        if segue.identifier == "openClass"{
            let destination = segue.destination as! ClassesBookViewController
            destination.dndClass = self.toSend as? ClassResponse
        }
    }
}
