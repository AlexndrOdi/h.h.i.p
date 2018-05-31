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
    @IBOutlet weak var inputConteinerView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    
    var bottomConstraint: NSLayoutConstraint?
    var chat: Chat?
    
    var presenter: CurrentChatViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        CurrentChatConfigurer.sharedInstance.configureCurrentChatView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardNotification), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardNotification), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        bottomConstraint = NSLayoutConstraint(item: inputConteinerView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        view.addConstraint(bottomConstraint!)
    }
    
    @objc func handleKeyBoardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let isKeyBoardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
            
            let keyBoardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
            bottomConstraint?.constant = isKeyBoardShowing ? -keyBoardFrame.height : 0
            view.updateConstraints()
            print(keyBoardFrame)
        }
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
        
        //TODO: сделать выборку для сообщений от пользователя и для сообщений от контакта..разделить цветом и разнести по сторонам
        cell.message.text = chat?.messeges[indexPath.row].text
        
        if let message = chat?.messeges[indexPath.row].text {
            let width = view.frame.width * 0.7// длина для ест фрейма
            var height: CGFloat = 40.0
            
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesLineFragmentOrigin
            
            let estimatedFrame = NSString(string: message).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0)], context: nil)
            if estimatedFrame.height >= 40.0 {
                height = estimatedFrame.height
            }
            //TODO: нифигово так режется текст, нужно поправить (поправил, но нужно последить)
            if chat?.messeges[indexPath.row].id == "12" {
                cell.message.frame = CGRect(x: 40 + 4, y: 0, width: width, height: height - 2)
                cell.textBubbleView.frame = CGRect(x: 40, y: 0, width: width + 4, height: height)
                cell.textBubbleView.backgroundColor = UIColor.yellow//UIColor(white: 0.95, alpha: 1)
                cell.message.textColor = UIColor.black

            } else {
                cell.message.frame = CGRect(x: view.frame.width - estimatedFrame.width - 16 - 8, y: 0, width: width, height: height - 2)
                cell.textBubbleView.frame = CGRect(x: view.frame.width - estimatedFrame.width - 16 - 8 - 4, y: 0, width: width + 4, height: height)
                cell.textBubbleView.backgroundColor = UIColor.purple
                cell.message.textColor = UIColor.white
            }
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        inputTextField.endEditing(true)
        inputTextField.resignFirstResponder()
        print("selected cell")
    }
}
