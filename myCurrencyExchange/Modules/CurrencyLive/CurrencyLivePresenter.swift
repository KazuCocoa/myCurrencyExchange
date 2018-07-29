//
//  CurrencyLivePresenter.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Foundation

// from view to presenter
protocol CurrencyLivePresenterProtocol {
    func getCurrencyLive()
}

// from interactor to presenter
protocol CurrencyLivePresenterOutputProtocol {
    func updateCurrencyResult(result: String)
    func showError(message: String)
}

// Presenter: contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
class CurrencyLivePresenter : CurrencyLivePresenterProtocol, CurrencyLivePresenterOutputProtocol {
    weak var view: ViewController!

    var interactor: CurrencyLiveInteractorInput!

    var wireframe: CurrencyLiveWireframe!

    init(view: ViewController) {
        self.view = view
        self.interactor = CurrencyLiveInteractor(presenter: self)
    }

    func getCurrencyLive() {
        self.interactor.getCurrencies(currency: self.view.currencyJPY.text!, with: .JPY)
    }

    func updateCurrencyResult(result: String) {
        self.view.updateCurrencyResult(result)
    }

    func showError(message: String) {
        self.view.showAllertMessage(message)
    }
}
