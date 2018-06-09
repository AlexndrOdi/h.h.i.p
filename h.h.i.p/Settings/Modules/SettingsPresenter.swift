//
//  SettingsPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol SettingsPresenterInputProtocol: SettingsViewControllerOutputProtocol, SettingsInteractorOutputProtocol {
    
}

class SettingsPresenter: SettingsPresenterInputProtocol {

    weak var view: SettingsViewControllerInputProtocol!
    var interactor: SettingsInteractorInputProtocol!
    var router: SettingsRouterInputProtocol!
 
    func fetchAllSettings() {
        interactor.fetchAllSettnigs()
    }
    
    func fetchProfileInfo() {
        interactor.fetchProfileInfo()
    }
    
    func provideAllSettings(settings: [Setting]) {
        view.displayAllSettings(settings: settings)
    }
    
    func provideProfileInfo(profile: Profile) {
        view.displayProfileInfo(profile: profile)
    }
    
    //Navigation
    func navigateToSetting() {
        router.navigateToSetting()
    }
    
    func navigateToProfile() {
        router.navigateToProfile()
    }
    
}
