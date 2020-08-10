//
//  LibraryViewController.swift
//  RpgDice
//
//  Created by Henrique Abreu on 10/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DndAPI.requestBase(endpoint: .monsters) { (result, error) in
            guard let result = result else{
                print(error!)
                return
            }
            print(result)
        }
        
        //TODO: Dropdown menu works
        //TODO: add activityIndicator
        //TODO: UI responds to requests

    }
    
}
