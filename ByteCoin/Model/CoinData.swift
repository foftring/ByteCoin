//
//  CoinData.swift
//  ByteCoin
//
//  Created by Frank Oftring on 10/6/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let coin: String
    let currency: String
    let rate: Float
}

extension CoinData {
    enum CodingKeys: String, CodingKey {
        case coin = "asset_id_base"
        case currency = "asset_id_quote"
        case rate
    }
}
