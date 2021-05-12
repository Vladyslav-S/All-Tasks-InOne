//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by MACsimus on 22.04.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmiAdvice: UILabel!
    @IBOutlet var bmiColour: UIView!
    // @IBOutlet weak var bmiBackgroundColour: UIImageView!
    
    var bmiValue: String?
    var advice: String?
    var colour: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        bmiAdvice.text = advice
        bmiColour.backgroundColor = colour
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

}
