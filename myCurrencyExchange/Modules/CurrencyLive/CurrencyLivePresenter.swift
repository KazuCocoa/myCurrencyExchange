//
//  CurrencyLivePresenter.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Foundation

class CurrencyLivePresenter {
    lazy var interactor: CurrencyLiveInteractor = CurrencyLiveInteractor(presentor: self)
    lazy var wireframe: CurrencyLiveWireframe = CurrencyLiveWireframe()
    weak var view: ViewController!

    init(view: ViewController) {
        self.view = view
    }

    func convertWith(currencies: CurrencyLiveCodable?) {
        guard let jpy = Double(view.currencyJPY.text!) else {
            view.showAlertWrongCurrency("You should input a number")
            return
        }

        if jpy < 0 {
            view.showAlertWrongCurrency("The number should be a natural number")
            return
        }

        var resultCurrency = "0"
        if let rate = currencies?.quotes.USDJPY {
             resultCurrency = "\(Int(round(jpy / rate)))"
        }

        view.currencyResult.text = resultCurrency
    }

    func update() {
        interactor.getCurrencies(currencies: "USD,JPY")
    }
}
