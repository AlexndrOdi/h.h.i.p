//
//  FinalStepNewGroupPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol FinalStepNewGroupPresenterInputProtocol: FinalStepNewGroupViewControllerOutputProtocol, FinalStepNewGroupInteractorOutputProtocol {
    
}

class FinalStepNewGroupPresenter: FinalStepNewGroupPresenterInputProtocol {

    weak var view: FinalStepNewGroupViewControllerInputProtocol!
    var interactor: FinalStepNewGroupInteractorInputProtocol!
    var router: FinalStepNewGroupRouterInputProtocol!
    
    func createGroup() {
        router.navigateToChat()
    }
    
    func providedContacts(_ contacts: [User]) {
        view.displayContacts(contacts)
    }
    
    func saveSelectedContacts(_ contacts: [User]) {
        interactor.initSelectedContacts(contacts)
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        
    }
    
    
}
