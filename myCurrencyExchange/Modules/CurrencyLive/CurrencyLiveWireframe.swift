//
//  CurrencyLiveWireframe.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Foundation

class CurrencyLiveWireframe {

    static func setupModule(view: ViewController) -> ViewController {
        let presenter = CurrencyLivePresenter(view: view)
        let interactor = CurrencyLiveInteractor(presenter: presenter)

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.wireframe = CurrencyLiveWireframe()

        interactor.presenter = presenter

        return view
    }
}
