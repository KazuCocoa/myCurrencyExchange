//
//  CurrencyLivePresenter.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Foundation

protocol CurrencyLivePresenterProtocol {
    func getCurrencyLive()
    func updateCurrencyResult(result: String)
    func showError(message: String)
}

// Presenter: contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
class CurrencyLivePresenter : CurrencyLivePresenterProtocol {
    lazy var interactor: CurrencyLiveInteractor = CurrencyLiveInteractor(presentor: self)
    lazy var wireframe: CurrencyLiveWireframe = CurrencyLiveWireframe()
    weak var view: ViewController!

    init(view: ViewController) {
        self.view = view
    }

    func getCurrencyLive() {
        interactor.getCurrencies(currency: view.currencyJPY.text!, with: "USD,JPY")
    }

    func updateCurrencyResult(result: String) {
        view.updateCurrencyResult(result)
    }

    func showError(message: String) {
        view.showAllertMessage(message)
    }
}
