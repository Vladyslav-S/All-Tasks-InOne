//
//  Question.swift
//  Quizzler
//
//  Created by MACsimus on 18.04.2021.
//

import Foundation
struct Question {
     
    let text: String
    let answer: String
    let variants: [String]
    
    init(q: String,  v: [String], a: String) {
        text = q
        answer = a
        variants = v
    }
   
}
