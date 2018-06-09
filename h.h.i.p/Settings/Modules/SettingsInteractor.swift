//
//  SettingsInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol SettingsInteractorInputProtocol: class {
    func fetchAllSettnigs()
    func fetchProfileInfo()
}

protocol SettingsInteractorOutputProtocol: class {
    func provideAllSettings(settings: [Setting])
    func provideProfileInfo(profile: Profile)
}

class SettingsInteractor: SettingsInteractorInputProtocol {

    var presenter: SettingsInteractorOutputProtocol!
    var DataManager: ChatDataManager!

    func fetchAllSettnigs() {
        let settings = DataManager.fetchAllSettingsFromCash()
        presenter?.provideAllSettings(settings: settings)
    }
    
    func fetchProfileInfo() {
        let profile = DataManager.fetchProfileInfoFromCash()
        presenter.provideProfileInfo(profile: profile)
    }
    
}
