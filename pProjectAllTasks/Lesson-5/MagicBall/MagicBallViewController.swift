//
//  ViewController.swift
//  MagicBall
//
//  Created by MACsimus on 18.04.2021.
//

import UIKit

class MagicBallViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var magicBallModel = LessonModel(name: "Fifth lesson", type: "BarabanJakubovicha", imageData: #imageLiteral(resourceName: "BTC"), withIdentifire: "MagicBallVC", storyboardName: "MagicBall")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        
        
        let balls = [#imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball3")]
        
        imageView.image = balls.randomElement()
        
    }
    
}

