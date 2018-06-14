//
//  NewGroupPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol NewGroupPresenterInputProtocol: NewGroupViewControllerOutputProtocol, NewGroupInteractorOutputProtocol {
    
}

class NewGroupPresenter: NewGroupPresenterInputProtocol {
    
    weak var view: NewGroupViewControllerInputProtocol!
    var interactor: NewGroupInteractorInputProtocol!
    var router: NewGroupRouterInputProtocol!
    
    func saveContacts(_ contacts: [User]) {
        interactor.initContacts(contacts)
    }
    func providedContacts(_ contacts: [User]) {
        view.displayContacts(contacts)
    }
    
    func passDataToNextStep(segue: UIStoryboardSegue) {
        router.passDataToNextStep(segue: segue)
    }
    
    
    //Navigation
    func navigateToNextStep() {
        router.navigateToNextStep()
    }
}
