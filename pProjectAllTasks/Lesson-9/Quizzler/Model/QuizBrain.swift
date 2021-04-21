//
//  QuizBrain.swift
//  Quizzler
//
//  Created by MACsimus on 18.04.2021.
//

import Foundation
struct QuizBrain {
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", v: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", v: ["25", "50", "100"], a: "100"),
        Question(q: "Five dollars is worth how many nickels?", v: ["25", "50", "100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", v: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
        Question(q: "Which is the largest organ in the human body?", v: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", v: ["25", "50", "100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", v: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", v: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", v: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", v: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", v: ["Green", "Orange", "Blue"], a: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", v: ["Rum", "Whisky", "Gin"], a: "Rum"),
        Question(q: "What type of animal was Harambe?", v: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
        Question(q: "Where is Tasmania located?", v: ["Indonesia", "Australia", "Scotland"], a: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    var variant = ""
    
    
    mutating func checkAnswer (_ userAnswer: String) -> Bool  {
        if userAnswer == quiz[questionNumber].answer {
            score  += 1
            return true
        }else {
              return false
        }
    }
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    func getProgress()  -> Float {
        let progress  = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    mutating func nexQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else {
            
            questionNumber = 0
            score = 0
        }
    }
    func getScore() -> Int {
        return score
    }
    func getVariants(i:Int) -> String {
        return quiz[questionNumber].variants[i]
    }
}
