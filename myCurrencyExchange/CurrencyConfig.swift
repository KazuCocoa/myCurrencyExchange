//
//  CurrencyConfig.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Foundation

struct CurrencyConfig {
    var baseURL: String
    let access_key = "35fe2cee5474e89d0309a19874f9a8ff"

    init() {
        if (ProcessInfo.processInfo.environment["ENVOY_BASEURL"] == nil) {
            baseURL = "http://apilayer.net/api"
        } else {
            baseURL = ProcessInfo.processInfo.environment["ENVOY_BASEURL"]!
        }
    }
}

enum CurrencyConvertFromUSD : String {
    case JPY = "JPY"
    case USD = "USD"
}
