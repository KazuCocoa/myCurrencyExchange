//
//  CurrencyLiveInteractor.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Foundation

class CurrencyLiveInteractor {
    lazy var currencyLiveService: CurrencyLiveService = CurrencyLiveService()
    weak var presentor: CurrencyLivePresenter!

    init(presentor: CurrencyLivePresenter) {
        self.presentor = presentor
    }

    func getCurrencies(currencies: String) {
        currencyLiveService.getLive(currencies: currencies,
                                    completion: { result, data in
                                        switch result{
                                        case true:
                                            self.updateCurrency(currencies: data)
                                        case false:
                                            self.updateCurrencyError(error: data)
                                        }
        })
    }

    private func updateCurrency(currencies: Any) {
        presentor.convertWith(currencies: currencies as? CurrencyLiveCodable)
    }

    func updateCurrencyError(error: Any) {
        presentor.view.showAlertWrongCurrency(((error as! Error).localizedDescription))
    }
}
