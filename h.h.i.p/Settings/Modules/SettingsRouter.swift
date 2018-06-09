//
//  SettingsRouter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol SettingsRouterInputProtocol: class {
    func passDataToNextScene(segue: UIStoryboardSegue)
    func navigateToSetting()
    func navigateToProfile()
}

class SettingsRouter: SettingsRouterInputProtocol {
    
    weak var viewController: SettingsViewController!
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        //SettingDetail
        //ProfileDetail
    }
    
    func navigateToSetting() {
        viewController.performSegue(withIdentifier: "SettingDetail", sender: nil)
    }
    
    func navigateToProfile() {
        viewController.performSegue(withIdentifier: "ProfileDetail", sender: nil)
    }
    
    
}
