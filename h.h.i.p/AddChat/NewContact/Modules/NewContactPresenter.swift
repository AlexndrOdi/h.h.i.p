//
//  NewContactPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 03.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol NewContactPresenterInputProtocol: NewContactViewControllerOutputProtocol, NewContactInteractorOutputProtocol {
    
}

class NewContactPresenter: NewContactPresenterInputProtocol {
    
    weak var view: NewContactViewControllerInputProtocol!
    var interactor: NewContactInteractorInputProtocol!
    var router: NewContactRouterInputProtocol!
    
    
    func pressDoneButton() {
        router.navigateToAddChatView()
        interactor.saveContact()
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        router.passDataToNextScene(segue: segue)
    }
}
