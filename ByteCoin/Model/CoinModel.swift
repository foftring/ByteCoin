//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Frank Oftring on 10/6/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let currency: String
    let rate: Float
    
    var currencyString: String {
        String(format: "%.2f", rate)
    }
}
