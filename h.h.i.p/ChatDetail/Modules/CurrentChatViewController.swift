//
//  CurrentChatViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol CurrentChatViewControllerOutputProtocol: class {
    func saveSelectedChat(chat: Chat)
}

protocol CurrentChatViewControllerInputProtocol: class {
    func displayCurrentChat(chat: Chat)
}

class CurrentChatViewController: UIViewController, CurrentChatViewControllerInputProtocol {

    //MARK: Properties
    @IBOutlet weak var messagesCollectionView: UICollectionView!
    @IBOutlet weak var inputMessageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var attachButton: UIButton!
    
    var chat: Chat?
    
    var presenter: CurrentChatViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        CurrentChatConfigurer.sharedInstance.configureCurrentChatView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func displayCurrentChat(chat: Chat) {
        self.chat = chat
        let messages = ["Пока будет вот такое длинющщее сообщение ибо ориентироваться надо именно на него. всякое говно случается, но тчобы такого....",
                        "Пока будет вот такое длинющщее сообщение ибо ориентироваться надо именно на него. всякое говно случается, но тчобы такого....Пока будет вот такое длинющщее сообщение ибо ориентироваться надо именно на него. всякое говно случается, но тчобы такого....Пока будет вот такое длинющщее сообщение ибо ориентироваться надо именно на него. всякое говно случается, но тчобы такого...."]
        self.chat?.messeges.append(contentsOf: [Messege(id: "15", text: messages.first!, date: Date()),
                                                Messege(id: "13", text: messages.last!, date: Date()),
                                                Messege(id: "22", text: "маленькое сообщение", date: Date())])
    }
    
}

extension CurrentChatViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chat?.messeges.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageViewCell.identifier, for: indexPath) as! MessageViewCell
        //TODO: переделать сообщения для чата
        //        guard let message = chat?.messeges[indexPath.row] else {
        //            fatalError("Not found message for current chat. Chat: \(String(describing: chat?.description)), message: \(String(describing: chat?.messeges[indexPath.row].description))")
        //        }
        
        //TODO: исправить потом, как будет нечего делать
//        cell.backgroundColor = UIColor.lightGray
//        cell.message.backgroundColor = UIColor.clear
        
        //TODO: сделать выборку для сообщений от пользователя и для сообщений от контакта..разделить цветом и разнести по сторонам
        cell.message.text = chat?.messeges[indexPath.row].text
        
        if let message = chat?.messeges[indexPath.row].text {
            let width = view.frame.width * 0.7// длина для ест фрейма
            var height: CGFloat = 40.0
            
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesLineFragmentOrigin
//            usesFontLeading.union(.usesLineFragmentOrigin)
            
            let estimatedFrame = NSString(string: message).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0)], context: nil)
            if estimatedFrame.height >= 40.0 {
                height = estimatedFrame.height
            }
            //TODO: нифигово так режется текст, нужно поправить (поправил, но нужно последить)
            cell.message.frame = CGRect(x: 40 + 4, y: 0, width: width, height: height - 2)
            cell.textBubbleView.frame = CGRect(x: 40, y: 0, width: width + 4, height: height)
        }
        
        return cell
    }
    
}
extension CurrentChatViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let message = chat?.messeges[indexPath.row].text {
            var height: CGFloat = 40.0
            
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesLineFragmentOrigin
//            .usesFontLeading.union(.usesLineFragmentOrigin)
            
            let estimatedFrame = NSString(string: message).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0)], context: nil)
            if estimatedFrame.height >= 40.0 {
                height = estimatedFrame.height
            }
            return CGSize(width: view.frame.width, height: height)
        }
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
}
extension CurrentChatViewController: UICollectionViewDelegate {
    //TODO: подумать, что здесь можно замутить
}
