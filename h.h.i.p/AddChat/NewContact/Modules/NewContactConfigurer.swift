//
//  NewContactConfigurer.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 03.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class NewContactConfigurer {
    
    static let sharedInstance = NewContactConfigurer()
    
    func configureNewContactView (viewController: NewContactViewController) {
        
        let presenter = NewContactPresenter()
        let interactor = NewContactInteractor()
        let router = NewContactRouter()
        let data = ChatDataManager()
        
        router.view = viewController
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.DataManager = data
        
    }
}
