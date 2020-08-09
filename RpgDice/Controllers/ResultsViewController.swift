//
//  ResultsViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 09/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(rollResult!)
        dateLabel.text = formatDate(date: rollDate!)
    }
    

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var rollResult: Int?
    var rollDate: Date?
    var dataController: DataController?
    
    func formatDate(date: Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let stringDate = formatter.string(from: date)
        
        return stringDate
    }

}
