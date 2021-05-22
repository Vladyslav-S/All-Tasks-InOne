//
//  ViewController.swift
//  I'm poor
//
//  Created by MACsimus on 18.04.2021.
//

import UIKit

class PoorViewController: UIViewController, ControllerIdentifiable {
    static var cellModel: LessonModel {
        
        return LessonModel(name: "Third lesson", type: "Picture)) ", imageData: #imageLiteral(resourceName: "DiceTwo"), withIdentifire: "PoorVC", storyboardName: "Poor")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    

}

