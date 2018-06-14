//
//  FinalStepNewGroupConfigurer.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class FinalStepNewGroupConfigurer {
    
    static let sharedInstance = FinalStepNewGroupConfigurer()
    
    func configureFinalStepNewGroupView(viewController: FinalStepNewGroupViewController) {
        
        let presenter = FinalStepNewGroupPresenter()
        let interactor = FinalStepNewGroupInteractor()
        let router = FinalStepNewGroupRouter()
        let dataManager = ChatDataManager()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.DataManager = dataManager
        
        router.view = viewController
    }
}
