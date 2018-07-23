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
        UsersAPI().user(number: 1, scrollableText: scrollableText)
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

let baseURL = "https://jsonplaceholder.typicode.com"

class UsersAPI {
    func user(number: Int, scrollableText: UITextView) {
        Alamofire.request("\(baseURL)/users/\(number)").responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                     scrollableText.text = "JSON: \(value)"
                }
            case .failure(let error):
                print(error)
            }

//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
//            }
        }
    }
}
