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
    
    @IBOutlet weak var scrollableText: UITextView!

    @IBAction func tapApiCall(_ sender: UIButton) {
        CurrencyLive().updateUSDJPY(scrollableText: scrollableText)
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

    func updateUSDJPY(scrollableText: UITextView) {
        let parameters: Parameters = [
            "access_key": access_key,
            "currencies": currencies,
            "format": format
        ]

        Alamofire.request(resourceURL, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    scrollableText.text = "JSON: \(value)"

                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

// TODO: codable for below response
//{
//    "success":true,
//    "terms":"https:\/\/currencylayer.com\/terms",
//    "privacy":"https:\/\/currencylayer.com\/privacy",
//    "timestamp":1532388547,
//    "source":"USD",
//    "quotes":{
//        "USDUSD":1,
//        "USDJPY":111.495003
//    }
//}
class CurrencyLiveCodable : Codable {

}
