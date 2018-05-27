//
//  ReuseIdentifierProtocol.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 27.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

public protocol ReuseIdentifierProtocol {
    static var identifier: String { get }
}

extension ReuseIdentifierProtocol where Self: UIView {
    static var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
