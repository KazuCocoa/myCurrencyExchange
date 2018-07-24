//
//  ViewController.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/22.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var apiCall: UIButton!
    
    @IBOutlet weak var currencyJPY: UITextField!

    @IBOutlet weak var currencyResult: UILabel!

    @IBAction func tapApiCall(_ sender: UIButton) {
        CurrencyLive().updateUSDJPY(currencyJPY: currencyJPY.text!, currencyResult: currencyResult)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }

    private func setupButton() {
        apiCall.setTitle("API CALL", for: UIControlState())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

import Alamofire

let baseURL = "http://apilayer.net/api"

class CurrencyLive {
    let resourceURL = "\(baseURL)/live"

    let access_key = "35fe2cee5474e89d0309a19874f9a8ff"
    let currencies = "USD,JPY"
    let format = "1"

    func updateUSDJPY(currencyJPY: String, currencyResult: UILabel) {
        let parameters: Parameters = [
            "access_key": access_key,
            "currencies": currencies,
            "format": format
        ]

        Alamofire.request(resourceURL, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    let currency = try? JSONDecoder().decode(CurrencyLiveCodable.self, from: data)
                    if let rate = currency?.quotes.USDJPY {
                        currencyResult.text = "\(Int(round(Double(currencyJPY)! / rate))) USD"
                    } else {
                        currencyResult.text = "no rate"
                    }

                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

class CurrencyLiveCodable : Codable {
    var success: Bool
    var terms: URL
    var privacy: URL
    var timestamp: Int
    var source: String
    var quotes: QuotedCurrency

}

class QuotedCurrency : Codable {
    var USDUSD: Double
    var USDJPY: Double
}
