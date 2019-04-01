//
//  APIClient.swift
//  BBC
//
//  Created by GlobalTMS on 21/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation
import Alamofire

typealias Method = Alamofire.HTTPMethod

class APIClient {
    func request(_ urlString: String, method: Method, parameters: Parameters? = nil, onSuccess: @escaping (Data) -> Void, onFailure: @escaping () -> Void) {

        let url = URL(string: urlString)
        let method = method
        let parameters = parameters
        let encoding = URLEncoding.default
        let headers = Alamofire.SessionManager.defaultHTTPHeaders
        
        let request = Alamofire.request(url!, method: method, parameters: parameters, encoding: encoding, headers: headers)

        request
            .validate()
            .responseData { (responseData) in
                guard let data = responseData.data else {
                    return onFailure()
                }
                onSuccess(data)
        }
    }
}
