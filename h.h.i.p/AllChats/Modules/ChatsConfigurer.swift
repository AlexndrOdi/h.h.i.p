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
    //необходимо дописывать все изменения и добавления взаимодейтсвия модулей
    static let sharedInstance = ChatsConfigurer()
    
    func configureChatsView(viewController: ChatsViewController) {
        let dataManager = ChatDataManager()
        let interactor = ChatsInteractor()
        let presenter = ChatsPresenter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.DataManager = dataManager
    }
}
