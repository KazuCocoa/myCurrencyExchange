//
//  ViewController.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/22.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var presenter: CurrencyLivePresenter = CurrencyLivePresenter(view: self)

    @IBOutlet weak var apiCall: UIButton!
    
    @IBOutlet weak var currencyJPY: UITextField!

    @IBOutlet weak var currencyResult: UILabel!

    @IBAction func tapApiCall(_ sender: UIButton) {
        presenter.update()
    }

    func showAlertWrongCurrency(_ message: String) {
        let alert = UIAlertController(title: "Wrong input", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
