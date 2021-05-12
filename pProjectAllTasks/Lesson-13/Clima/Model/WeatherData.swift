//
//  WeatherData.swift
//  Clima
//
//  Created by MACsimus on 29.04.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    //    let coord: Coord
    let weather: [Weather]
    //    let base: String
    let main: Main
    //    let visibility: Int
    //    let wind: Wind
    //    let clouds: Clouds
    ////    let dt: Int
    //    let sys: Sys
    //    let timezone: Int
    //    let id: Int
    let name: String
    //    let cod: Int
}

//struct Coord: Decodable {
//    let lon: Float
//    let lat: Float
//}

struct Weather: Decodable {
    let id: Int
    //    let main: String
    let description: String
    //    let icon: String
}

struct Main: Decodable {
    let temp: Double
    //    let feels_like: Double
    //    let temp_min: Double
    //    let temp_max: Double
    //    let pressure: Int
    //    let humidit: Double
}

//struct Wind: Decodable {
//    let speed: Double
//    let deg: Double
//    let gust: Double
//}

//struct Clouds: Decodable {
//    let all: Int
//}

//struct Sys: Decodable {
//    let type: Int
//    let id: Int
//    let country: String
//    let sunrise: Int
//    let sunset: Int
//}

