//
//  ViewController.swift
//  I'm rich
//
//  Created by MACsimus on 16.04.2021.
//

import UIKit

class RichViewController: UIViewController, ControllerIdentifiable {
    static var cellModel: LessonModel {
        
            return LessonModel(name: "Second lesson", type: "Rich", imageData: #imageLiteral(resourceName: "DiceOne"), withIdentifire: "RichVC", storyboardName: "Rich")
        // only  get get { }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}

