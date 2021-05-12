//
//  ViewController.swift
//  Dice
//
//  Created by MACsimus on 18.04.2021.
//

import UIKit

class DiceViewController: UIViewController {

    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    

    var diceModel = LessonModel(name: "Fourth lesson", type: "Ryletka", imageData: #imageLiteral(resourceName: "DiceThree"), withIdentifire: "DiceVC", storyboardName: "Dice")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func rollAction(_ sender: Any) {
        
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        firstDice.image = diceArray.randomElement()
        secondDice.image = diceArray.randomElement()
    }
    


}

