//
//  CurrencyLiveInteractor.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Foundation

// Interactor: contains the business logic as specified by a use case.
class CurrencyLiveInteractor {
    lazy var currencyLiveService: CurrencyLiveService = CurrencyLiveService()
    weak var presentor: CurrencyLivePresenter!

    init(presentor: CurrencyLivePresenter) {
        self.presentor = presentor
    }

    func getCurrencies(currency: String, with currencies: String) {
        currencyLiveService.getLive(currencies: currencies,
                                    completion: { result, data in
                                        switch result{
                                        case true:
                                            self.convert(currency: currency, with: data)
                                        case false:
                                            self.updateCurrencyError(error: data)
                                        }
        })
    }

    private func convert(currency: String, with currencies: Any) {
        guard let jpy = Double(currency) else {
            presentor.showError(message: "You should input a number")
            return
        }

        if jpy < 0 {
            presentor.showError(message: "The number should be a natural number")
            return
        }

        var resultCurrency = "0"
        if let rate = (currencies as? CurrencyLiveCodable)?.quotes.USDJPY {
            resultCurrency = "\(Int(round(jpy / rate)))"
        }

        presentor.updateCurrencyResult(result: resultCurrency)
    }

    func updateCurrencyError(error: Any) {
        presentor.showError(message: ((error as! Error).localizedDescription))
    }
}
