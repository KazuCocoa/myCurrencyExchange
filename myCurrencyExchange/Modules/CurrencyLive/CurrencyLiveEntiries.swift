//
//  CurrencyLiveEntiries.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Foundation

struct CurrencyLiveCodable : Codable {
    var success: Bool
    var terms: URL
    var privacy: URL
    var timestamp: Int
    var source: String
    var quotes: QuotedCurrency

    internal struct QuotedCurrency : Codable {
        var USDJPY: Double
    }
}
