//
//  NewGroupConfigurer.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class NewGroupConfigurer {
    
    static let sharedInstance = NewGroupConfigurer()
    
    func configureNewGroupView(viewController: NewGroupViewController){
        
        let presenter = NewGroupPresenter()
        let interactor = NewGroupInteractor()
        let router = NewGroupRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = viewController
    }
}
