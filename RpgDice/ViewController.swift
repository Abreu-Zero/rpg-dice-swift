//
//  ViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 29/05/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    func  rollDice(dice : Int) -> Int{
        switch dice {
        case 6:
            return Int.random(in: 1 ... 6)
        case 8:
            return Int.random(in: 1 ... 8)
        case 12:
            return Int.random(in: 1 ... 12)
        default:
            return Int.random(in: 1 ... 20)
        }
    }
    
    func setLabelTxt(text : Int){
        resultLabel.text = String(text)
        
    }
    
    @IBAction func rollD6(_ sender: Any) {
        
        let result = rollDice(dice: 6)
        setLabelTxt(text: result)
        
    }
    
    @IBAction func rollD8(_ sender: Any) {
        
        let result = rollDice(dice: 8)
        setLabelTxt(text: result)
    }
    
    @IBAction func rollD12(_ sender: Any) {
        let result = rollDice(dice: 12)
               setLabelTxt(text: result)
    }
    
    @IBAction func rollD20(_ sender: Any) {
        let result = rollDice(dice: 20)
               setLabelTxt(text: result)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

