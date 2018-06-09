//
//  AlamofireManager.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 01.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireManager: HttpManagerProtocol {
    
    private var manager: Alamofire.SessionManager
    
    init(serverTrustPolicyes: [String : ServerTrustPolicy]) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        manager = Alamofire.SessionManager(configuration: configuration,
                                           serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicyes)
        )
    }
 
    func send(request: HttpRequestProtocol) {
        //TODO: добавить проверку на валидность ссылки реквеста
//        let urlReq = request.url
        
        //TODO: закончить метод
    }
    
    func create(url: URLRequest, method: HttpRequest.Methods, headers: [(key: String, value: String)], needAuth: Bool) -> HttpRequestProtocol {
        return AlamofireRequest(url: url, method: method, needAuth: needAuth)
    }

}
