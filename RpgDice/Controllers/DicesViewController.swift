//
//  DicesViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 29/05/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//
// This VC handles all the rolls and shows the next views
// From here you can go to the ResultsVC or the HistoryVC

import UIKit

class DicesViewController: UIViewController {
    
    var result: Int?
    var dataController: DataController?
    
    //This func handles all the IBActions called
    //Results are going to be displayed in the next ViewController
    
    func  rollDice(dice : Int) -> Int{
        return Int.random(in: 1 ... dice)
    }
    
    func rollAndSend(dice: Int){
        self.result = rollDice(dice: dice)
        
        let die = Roll(context: dataController!.viewContext)
        die.result = String(self.result!)
        die.creationDate = Date()
        die.die = String(dice)
        
        try? dataController?.viewContext.save()
        
        performSegue(withIdentifier: "rollResult", sender: self)
    }
    
    //MARK: IBActions for the rolls
    
    @IBAction func rollD4(_ sender: Any) {
        rollAndSend(dice: 4)
    }
    
    @IBAction func rollD6(_ sender: Any) {
        rollAndSend(dice: 6)
    }
    
    @IBAction func rollD8(_ sender: Any) {
        rollAndSend(dice: 8)
    }
    
    @IBAction func rollD10(_ sender: Any) {
        rollAndSend(dice: 10)
    }
    
    @IBAction func rollD12(_ sender: Any) {
        rollAndSend(dice: 12)
    }
    
    @IBAction func rollD20(_ sender: Any) {
        rollAndSend(dice: 20)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rollResult"{
            let vcDest = segue.destination as! ResultsViewController
            vcDest.rollResult = result
            vcDest.dataController = dataController
            vcDest.rollDate = Date()
        }
    
    }
    
}

