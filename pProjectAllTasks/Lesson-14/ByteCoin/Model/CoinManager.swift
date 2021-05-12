//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    
    func didFailWithError(error: Error)
    func didUpdateCurrency(currency: String, price: String)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?

    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    // BTC, ETH, DOGE, XMR
    let apiKey = "D520995E-2E5A-4C4F-8A70-1CE1A57B8726"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR","UAH"]
    
   
    
    func getCoinPrice (for currency: String) {
        
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        // 1- create a url
        if let url = URL(string: urlString) {
            // 2- create a url session
            let session = URLSession(configuration: .default)
            // 3- give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    
                if let price = self.parseJSON(safeData) {
                        
                        let formatedPrice = String(format: "%.2f", price)

                        delegate?.didUpdateCurrency(currency: currency, price: formatedPrice )
                    }
                }
            }
            // 4- start the task
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> Double? {
        
        //Create a JSONDecoder
        let decoder = JSONDecoder()
        
        do {
            //try to decode the data using the CoinData structure
            let decodedData  = try decoder.decode(CoinData.self, from: coinData)
            //Get the property from the decoded data.
            let exchangeRate = decodedData.rate
            print(exchangeRate)
            return exchangeRate
        } catch {
            //Catch and print any errors.
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
