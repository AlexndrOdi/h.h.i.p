//
//  SettingsInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol SettingsInteractorInputProtocol: class {
    
}

protocol SettingsInteractorOutputProtocol: class {
    
}

class SettingsInteractor: SettingsInteractorInputProtocol {
    
    var presenter: SettingsInteractorOutputProtocol!
}
