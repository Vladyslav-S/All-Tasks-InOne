//
//  ViewController.swift
//  I'm poor
//
//  Created by MACsimus on 18.04.2021.
//

import UIKit

class PoorViewController: UIViewController {

    var poorModel = LessonModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        poorModel.name = "Third lesson"
        poorModel.type = "I'm Poor"
        poorModel.imageData = #imageLiteral(resourceName: "DiceThree")
        
       
    }

    

}

