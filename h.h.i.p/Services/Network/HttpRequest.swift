//
//  HttpRequest.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 26.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

struct HttpRequest {
    //TODO: доделать реквест
    enum ErrorCodes: Int {
        case forbiden = 403
    }
    
    enum Methods: String {
        case get    = "GET"
        case post   = "POST"
        case put    = "PUT"
        case delete = "DELETE"
    }
    
    enum Results {
        case success(Data?)
        case error(Error, Data?)
    }
}
