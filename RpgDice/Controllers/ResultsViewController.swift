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
        
        let toPop: [UILabel] = [prevResult1, prevResult2, prevResult3]
        
        let fetchRequest : NSFetchRequest<Roll> = Roll.fetchRequest()
        let sortDescription = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescription]
        
        for p in toPop{
            p.text = ""
        }
        
        guard let result = try? dataController?.viewContext.fetch(fetchRequest) else{return}
        
        prevResults = result
        var dates: [String] = []
        if prevResults!.count > 0{
            for i in (1..<prevResults!.count){
                dates.append(formatDate(date: prevResults![i].creationDate!))
                if dates.count >= 3{
                    break
                }
            }
            for i in (0..<dates.count){
                toPop[i].text = "rolled a D\(String(prevResults![i+1].die!)) and got \(prevResults![i+1].result!) at \(dates[i])"
                
                if i >= 3{
                    break
                }
            }
            
            diceLabel.text = "D\(prevResults![0].die!)"
        }

    }

    //MARK: share funcs
    
    @IBAction func shareRoll(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [saveRollImg()], applicationActivities: [])
        self.present(shareController, animated: true, completion: nil)
    }
    
    func saveRollImg() -> UIImage{
       
       UIGraphicsBeginImageContext(self.view.frame.size)
       view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
       let rollImg : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
       UIGraphicsEndImageContext()
        
        return rollImg
    }

}

