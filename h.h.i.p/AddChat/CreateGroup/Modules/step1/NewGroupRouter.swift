//
//  NewGroupRouter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol NewGroupRouterInputProtocol: class {
    func navigateToNextStep()
    func passDataToNextStep(segue: UIStoryboardSegue)
}

class NewGroupRouter: NewGroupRouterInputProtocol {
    
    weak var view: NewGroupViewController!

    func navigateToNextStep() {
        self.view.performSegue(withIdentifier: "NextStep", sender: nil)
    }
    
    func passDataToNextStep(segue: UIStoryboardSegue) {
        if segue.identifier == "NextStep" {
            guard let finalStepViewController = segue.destination as? FinalStepNewGroupViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }

            let selectedContacts = self.view.selectedContacts
            finalStepViewController.presenter.saveSelectedContacts(selectedContacts)
        }
    }
}
