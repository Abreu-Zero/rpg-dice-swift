//
//  ResultsViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 09/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit
import CoreData

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(rollResult!)
        dateLabel.text = formatDate(date: rollDate!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPreviousResults()
    }
    

    @IBOutlet weak var diceLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var prevResult1: UILabel!
    @IBOutlet weak var prevResult2: UILabel!
    @IBOutlet weak var prevResult3: UILabel!
    
    var rollResult: Int?
    var rollDate: Date?
    var dataController: DataController?
    var prevResults: [Roll]?
    
    func formatDate(date: Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let stringDate = formatter.string(from: date)
        
        return stringDate
    }
    
    func loadPreviousResults(){
        
        let fetchRequest : NSFetchRequest<Roll> = Roll.fetchRequest()
        let sortDescription = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescription]
        
        guard let result = try? dataController?.viewContext.fetch(fetchRequest) else{
            prevResult1.text = "No result found"
            prevResult2.text = "No result found"
            prevResult3.text = "No result found"
            return
        }
        prevResults = result
        var dates: [String] = []
        
        for i in (1...4){
            dates.append(formatDate(date: prevResults![i].creationDate!))
        }
        diceLabel.text = "D\(prevResults![0].die!)"
        prevResult1.text = "rolled a D\(String(prevResults![1].die!)) and got \(prevResults![1].result!) at \(dates[0])"
        prevResult2.text = "rolled a D\(String(prevResults![2].die!)) and got \(prevResults![2].result!) at \(dates[1])"
        prevResult3.text = "rolled a D\(String(prevResults![3].die!)) and got \(String(prevResults![3].result!)) at \(dates[2])"

    }

}
