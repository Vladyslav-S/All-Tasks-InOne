//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var chatModel = LessonModel(name: "Fiveteenth lesson", type: "Chat on firebase", imageData: #imageLiteral(resourceName: "appstore"), withIdentifire: "FlashChatVC", storyboardName: "FlashChat")
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(animated) // Must do this in order to documentation
        navigationController?.navigationBar.barTintColor = UIColor(named: "BrandBlue")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
                titleLabel.text = ""
                var timerIndex = 0.0
                let titleText = "⚡️FlashChat"
                for letter in titleText {
                    Timer.scheduledTimer(withTimeInterval: 0.1 * timerIndex, repeats: false) { (timer) in
                        self.titleLabel.text?.append(letter)
                    }
                    timerIndex += 1
                }
    }
    
    

}
