//
//  WeatherModel.swift
//  Clima
//
//  Created by MACsimus on 29.04.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let nameOfCity: String
    let temperature: Double
    
    //MARK:-Computed property
    var temperatureString: String {
        
        return String(format: "%.1f", temperature)
        
    }
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.heavyrain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...802:
            return "cloud.sun"
        case 803...804:
            return "cloud"
        default:
            return "lock"
        }
    }
}
