//
//  ViewController.swift
//  I'm rich
//
//  Created by MACsimus on 16.04.2021.
//

import UIKit

class RichViewController: UIViewController {

    
    var richModel = LessonModel(name: "Second lesson", type: "I'm Rich", imageData: #imageLiteral(resourceName: "DiceOne"), withIdentifire: "PoorVC", storyboardName: "I'mRich", viewController: RichViewController.Type)
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

