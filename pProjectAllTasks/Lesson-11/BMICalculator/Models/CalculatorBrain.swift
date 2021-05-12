//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by MACsimus on 22.04.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain {
    
    var bmi: BMI?
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
       let  bmiValue = weight / (height * height)
        
        
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, colour: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), recomendation: "Eat more pies")
        } else  if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, colour: .green, recomendation: "U r Fit")
        } else {
            bmi = BMI(value: bmiValue, colour: .red, recomendation: "Fat butt")
        }
    }
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f" , bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    func getColour() -> UIColor {
        return bmi?.colour ?? .white
    }
    func getAdvice() -> String {
        return bmi?.recomendation ?? "Default Value No Advice"
    }
}
