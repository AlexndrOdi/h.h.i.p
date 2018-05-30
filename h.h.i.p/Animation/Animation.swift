//
//  Animation.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 27.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

//Анимация скрытия/показа таббара
func animateHidingTabBar(viewController: UIViewController?) {
    //TODO: доделать анимацию
    viewController?.tabBarController?.tabBar.isHidden = true
}
func animateDisplayTabBar(viewController: UIViewController?) {
    //TODO: доделать анимацию
    viewController?.tabBarController?.tabBar.isHidden = false
}
