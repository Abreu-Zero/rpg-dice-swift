//
//  HistoryViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 09/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UITableViewController {

    var previousResults: [Roll]?
    var dataController: DataController?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPreviousResults()
    }
    
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
            return
        }
        previousResults = result
        tableView.reloadData()

    }
    

     // MARK: Table view data source
       
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return previousResults!.count
       }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "rollCell", for: indexPath)
        cell.textLabel?.text = "D\(previousResults![indexPath.row].die!) rolled a \(previousResults![indexPath.row].result!)"
        cell.detailTextLabel?.text = formatDate(date: previousResults![indexPath.row].creationDate!)
           return cell
       }

    @IBAction func deleteHistory(_ sender: Any) {
        for roll in previousResults!{
            dataController?.viewContext.delete(roll)
        }
        do{
            try dataController?.viewContext.save()

        } catch{
            print("ERROR: error while saving the data")
        }
        previousResults = []
        tableView.reloadData()
    }
}
