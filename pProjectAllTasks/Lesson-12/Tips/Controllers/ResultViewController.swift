//
//  ResultViewController.swift
//  Tipsy
//
//  Created by MACsimus on 27.04.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tip =  0
    var numbOfPeople = 1
    var money = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = money
        settingsLabel.text = "Split between \(numbOfPeople) people, with \(tip)% tip."
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
         
        self.dismiss(animated: true, completion: nil)
        
    }
    
 

}
