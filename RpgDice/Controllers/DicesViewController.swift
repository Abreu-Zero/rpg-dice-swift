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
    
    //This func handles all the IBActions called
    //Results are going to be displayed in the next ViewController
    
    func  rollDice(dice : Int) -> Int{
        var result: Int?
        
        switch dice {
        case 4:
            result = Int.random(in: 1 ... 4)
        case 6:
            result = Int.random(in: 1 ... 6)
        case 8:
            result = Int.random(in: 1 ... 8)
        case 10:
            result = Int.random(in: 1 ... 10)
        case 12:
            result = Int.random(in: 1 ... 12)
        default:
            result = Int.random(in: 1 ... 20)
        }
        
        
        return result!
    }
    
    //MARK: IBActions for the rolls
    @IBAction func rollD6(_ sender: Any) {
        self.result = rollDice(dice: 6)
        performSegue(withIdentifier: "rollResult", sender: self)

    }
    
    @IBAction func rollD8(_ sender: Any) {
        self.result = rollDice(dice: 8)
        performSegue(withIdentifier: "rollResult", sender: self)

    }
    
    @IBAction func rollD12(_ sender: Any) {
        self.result = rollDice(dice: 12)
    }
    
    @IBAction func rollD20(_ sender: Any) {
        self.result = rollDice(dice: 20)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rollResult"{
            let vcDest = segue.destination as! ResultsViewController
            vcDest.rollResult = result
        }
    
    }
    
}

