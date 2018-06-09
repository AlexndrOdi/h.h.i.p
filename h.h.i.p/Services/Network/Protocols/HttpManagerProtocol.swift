//
//  HttpManagerProtocol.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 01.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol HttpManagerProtocol {
    
    func send(request: HttpRequestProtocol)
    func create(url: URLRequest, method: HttpRequest.Methods, headers: [(key: String, value: String)], needAuth: Bool) -> HttpRequestProtocol
    
}
