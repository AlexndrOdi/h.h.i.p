//
//  FinalStepNewGroupRouter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol FinalStepNewGroupRouterInputProtocol: class {
    func navigateToChat()
    func passDataToNextScene(segue: UIStoryboardSegue)
}

class FinalStepNewGroupRouter: FinalStepNewGroupRouterInputProtocol {
 
    weak var view: FinalStepNewGroupViewController!
    
    func navigateToChat() {
        self.view.navigationController?.popToRootViewController(animated: true)
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        //TODO: сохранить в дата базу и отправить на бе
    }
}
