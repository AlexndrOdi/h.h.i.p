//
//  RequestImpl.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 01.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation
import Alamofire

//TODO: имплементация хттп протокола
class AlamofireRequest: HttpRequestProtocol {
    
    var url: URLRequest
    var data: Data?
    var headers: [String : String] = [:]
    var method: HttpRequest.Methods
    var body: [String : String] = [:]
    var needAuth: Bool

    init(url: URLRequest, method: HttpRequest.Methods, needAuth: Bool) {
        self.url = url
        self.method = method
        self.needAuth = needAuth
    }
    
    func setHeaders(headers: [(key: String, value: String)]) -> Self {
        headers.forEach {
            self.headers.updateValue($0.value, forKey: $0.key)
        }
        return self
    }

    func setBody(parameters: [String : String]) -> Self {
        parameters.forEach {
            self.body.updateValue($0.value, forKey: $0.key)
        }
        return self
    }
    
    func setData(_ data: Data) -> Self {
        self.data = data
        return self
    }
}
