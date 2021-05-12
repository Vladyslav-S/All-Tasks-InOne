//
//  ViewController.swift
//  I'm rich
//
//  Created by MACsimus on 16.04.2021.
//

import UIKit

class RichViewController: UIViewController {

    
    var richModel = LessonModel(name: "Second lesson", type: "Rich", imageData: #imageLiteral(resourceName: "DiceOne"), withIdentifire: "RichVC", storyboardName: "Rich")
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

