//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class DestinyViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var destinyModel = LessonModel(name: "Tenth lesson", type: "Destiny", imageData: #imageLiteral(resourceName: "coal"), withIdentifire: "DestinyVC", storyboardName: "Destiny")
    var storyBrain = StoryBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       refresh()
    }
    @IBAction func choiceMade(_ sender: UIButton) {
        
        storyBrain.setStory(sender.currentTitle!)
        refresh()
        
    }
    
    func refresh() {
        
        storyLabel.text = storyBrain.setQuestionText()
        choice1Button.setTitle(storyBrain.setChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.setChoice2(), for: .normal)
        
    }
    


}

