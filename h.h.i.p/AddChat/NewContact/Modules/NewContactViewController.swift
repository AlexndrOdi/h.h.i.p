//
//  NewContactViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 03.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol NewContactInputProtocol: class {
    
}

protocol NewContactOutputProtocol: class {
    
}

class NewContactViewController: UIViewController, NewContactInputProtocol {

    var presenter: NewContactOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
