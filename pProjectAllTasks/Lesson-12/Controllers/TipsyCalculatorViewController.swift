//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPtcButton: UIButton!
    @IBOutlet weak var tenPtcButton: UIButton!
    @IBOutlet weak var twentyPtcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var numberOfPeoplr = 2
    var totalBil = 0.0
    var endResult = "0.0"
    
    @IBAction func tipCtanged(_ sender: UIButton) {
        
        zeroPtcButton.isSelected = false
        tenPtcButton.isSelected = false
        twentyPtcButton.isSelected = false
        sender.isSelected = true
        
        let myString = sender.currentTitle
        let croppedString = String(myString?.dropLast() ?? "Error  in croping")
        //let croppedString = myString?.remove(at: myString?.index(before: myString?.endIndex))
        let titleAsNumber = Double(croppedString)!
        
        tip = titleAsNumber / 100
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeoplr = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != ""  {
            totalBil = Double(bill)!
            let result = (totalBil + (totalBil * tip)) / (Double(numberOfPeoplr))
            endResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVc = segue.destination as! ResultViewController
            
            destinationVc.money = endResult
            destinationVc.tip = Int(tip * 100)
            destinationVc.numbOfPeople = numberOfPeoplr
        }
    }
    
}

