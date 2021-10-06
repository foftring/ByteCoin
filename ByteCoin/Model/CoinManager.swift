//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

class CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "1850B49F-BEB5-4FD4-B012-3599D2E68162"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchData(exchangeCurrency: String) {
        
        if let url = URL(string: "\(baseURL)/\(exchangeCurrency)/?apikey=\(apiKey)") {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!.localizedDescription)
                    print("Networking error")
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let coinData = try decoder.decode(CoinData.self, from: data)
                            let exchangeCurrency = coinData.currency
                            let rate = coinData.rate
                            let coin = CoinModel(coinName: exchangeCurrency, rate: rate)
                            print(coin)
                        } catch {
                            print(error)
                        }
                    } else {
                        print("Error decoding")
                    }
                }
            }
            .resume()
        }
    }
}
