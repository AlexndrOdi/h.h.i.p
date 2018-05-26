//
//  Modalable.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 26.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol Modaleble: Codable, Equatable {
}

extension Modaleble {
    //MARK: Properties
    var description: String {
        return String(describing: self)
    }
    
    var toJSONString: String{
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(self),
            let jsonString = String(data: jsonData, encoding: .utf8) else {
            return ""
        }
        return jsonString
    }
    
    //MARK: Functions
    static func from (json: Data?) -> Self? {
        let decoder = JSONDecoder()
        guard let jsonData = json,
            let model = try? decoder.decode(self, from: jsonData) else {
                return nil
        }
        return model
    }
}
