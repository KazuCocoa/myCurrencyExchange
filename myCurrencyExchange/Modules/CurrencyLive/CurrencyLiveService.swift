//
//  api.swift
//  myCurrencyExchange
//
//  Created by kazuaki matsuo on 2018/07/28.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import Alamofire

typealias CurrencyLiveServiceCompletion = (Bool, Any) -> ()

struct CurrencyLiveService {
    let resourceURL = "\(CurrencyConfig().baseURL)/live"

    func getLive(currencies: String, completion: @escaping CurrencyLiveServiceCompletion) {
        let format = "1"

        let parameters: Parameters = [
            "access_key": CurrencyConfig().access_key,
            "currencies": currencies,
            "format": format
        ]

        let request = Alamofire.request(resourceURL,
                                        method: .get,
                                        parameters: parameters,
                                        encoding: URLEncoding.default)

        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let data = response.data else { return }

                // TODO: use the value
                print(value)

                let currencies =  try? JSONDecoder().decode(CurrencyLiveCodable.self, from: data)
                completion(true, currencies!) // TODO: avoid force unwrap

            case .failure(let error):
                completion(false, error)
            }

        }
    }
}
