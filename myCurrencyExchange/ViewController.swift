//
//  ViewController.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/22.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UsersAPI().user(number: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

import Alamofire

let baseURL = "https://jsonplaceholder.typicode.com"

class UsersAPI {
    func user(number: Int) {
        Alamofire.request("\(baseURL)/users/\(number)").responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }
}
