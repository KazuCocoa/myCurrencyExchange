//
//  CurrencyLiveView.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

//import Foundation

// View: displays what it is told to by the Presenter and relays user input back to the Presenter.

protocol CurrencyLiveViewProtocol {
    func updateCurrencyResult(_ text: String)
    func showAllertMessage(_ message: String)
}

// ViewController
//protocol CurrencyLiveView {
//
//}
