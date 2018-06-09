//
//  NetworkService.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 31.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol NetworkServiceInputProtocol: class {
    
}

protocol NetworkServiceOutputProtocol: class {
    
}

struct TestStruct: Decodable, Modaleble {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
}

class NetworkService: NetworkServiceInputProtocol {

    func doSomething() {
        
    }
    
}
