//
//  ViewController.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/22.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CurrencyLiveViewProtocol {

    var presenter: CurrencyLivePresenter!

    @IBOutlet weak var apiCall: UIButton!
    
    @IBOutlet weak var currencyJPY: UITextField!

    @IBOutlet weak var currencyResult: UILabel!

    @IBAction func tapApiCall(_ sender: UIButton) {
        self.presenter.getCurrencyLive()
    }

    override func viewDidLoad() {
        self.presenter = CurrencyLivePresenter(view: self)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateCurrencyResult(_ text: String) {
        currencyResult.text = text
    }

    func showAllertMessage(_ message: String) {
        let alert = UIAlertController(title: "Wrong input", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
