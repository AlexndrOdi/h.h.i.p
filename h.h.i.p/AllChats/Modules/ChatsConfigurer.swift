//
//  ChatsConfigurer.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 26.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class ChatsConfigurer {
    //TODO: сборщик модулей : конфигуратор контроллера - презентер - интерактор - дата манагер

    static let sharedInstance = ChatsConfigurer()
    
    func configureChatsView(viewController: ChatsViewController) {
        let dataManager = ChatDataManager()
        let interactor = ChatsInteractor()
        let preneter = ChatsPresenter()
        viewController.presenter = preneter
        preneter.interactor = interactor
        interactor.DataManager = dataManager
    }
}
