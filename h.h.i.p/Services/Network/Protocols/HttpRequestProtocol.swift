//
//  HttpRequestProtocol.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 01.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol HttpRequestProtocol {
    
    var url: URLRequest { get set }
    var data: Data? { get set }
    var headers: [String: String] { get set }
    var method: HttpRequest.Methods { get set }
    var body: [String: String] { get set }
    
    func setHeaders(headers: [(key: String, value: String)]) -> Self
    func setBody(parameters: [String: String]) -> Self
}
