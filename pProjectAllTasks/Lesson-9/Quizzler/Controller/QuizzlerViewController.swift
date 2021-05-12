//
//  ViewController.swift
//  Quizzler
//
//  Created by MACsimus on 18.04.2021.
//

import UIKit

class QuizzlerViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var firstVariantButton: UIButton!
    @IBOutlet weak var secondVariantButton: UIButton!
    @IBOutlet weak var thirdVariantButton: UIButton!
    
    var quizzlerModel = LessonModel(name: "Nineth lesson", type: "Quizzler", imageData: #imageLiteral(resourceName: "DOGE"), withIdentifire: "QuizzlerVC", storyboardName: "Quizzler")
    
    var quizBrain = QuizBrain()
       
    override func viewDidLoad() {
        
        super.viewDidLoad()
        refresh()
    }
    
    @IBAction func answerButtomPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
       
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nexQuestion()
       Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(refresh), userInfo: nil, repeats: false)
    }
    
    @objc func refresh () {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = " Score: \(quizBrain.getScore())"
        
        firstVariantButton.setTitle(quizBrain.getVariants(i: 0), for: .normal)
        secondVariantButton.setTitle(quizBrain.getVariants(i: 1), for: .normal)
        thirdVariantButton.setTitle(quizBrain.getVariants(i: 2), for: .normal)
        
        firstVariantButton.backgroundColor = .clear
        secondVariantButton.backgroundColor = .clear
        thirdVariantButton.backgroundColor = .clear
    }
}

