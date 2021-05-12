//
//  WeatherManager.swift
//  Clima
//
//  Created by MACsimus on 28.04.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation
import CoreData

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5d6cd1ea2bf795bf845d0acdd3e4b424&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String) {
        let URLString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: URLString)
    }
    func fetchWeather (latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let URLString = ("\(weatherURL)&lat=\(latitude)&lon=\(longitude)")
        performRequest(with: URLString)
    }
    func performRequest(with urlString: String) {
        // 1- create a url
        if let url = URL(string: urlString) {
            // 2- create a url session
            let session = URLSession(configuration: .default)
            // 3- give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4- start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodetData  = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodetData.weather[0].id
            let temp = decodetData.main.temp
            let city = decodetData.name
            
            let weather = WeatherModel(conditionId: id, nameOfCity: city, temperature: temp)
//            print(weather.conditionName)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
