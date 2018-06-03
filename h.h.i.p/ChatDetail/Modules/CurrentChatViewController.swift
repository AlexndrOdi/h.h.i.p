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
    @IBOutlet weak var sendButton: UIButton!
    
    
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
        sendButton.layer.cornerRadius = 20
        view.addConstraint(bottomConstraint!)

        scrollsCollectionViewToBottom(animated: false)
    }
    //MARK: Private methods
    @objc func handleKeyBoardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let isKeyBoardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
            
            let keyBoardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
            bottomConstraint?.constant = isKeyBoardShowing ? -keyBoardFrame.height : 0
            
            //TODO: анимация с клавиатурой - переснити потом в анимэйшен
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(completed) in
                if isKeyBoardShowing {
                    let indexPath = IndexPath(item: (self.chat?.messeges.count)! - 1, section: 0)
                        self.messagesCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
                }
            })
        }
    }
    //TODO: пока заглушка, но нужно переписать будет после настройки сокета
    @IBAction func sendMessage(_ sender: UIButton) {
        let messege = Messege(id: "some_id", text: inputTextField.text!, date: Date())
        inputTextField.text = nil
        
        chat?.messeges.append(messege)
        guard let chat = chat else {
            fatalError("Chat not found: \(String(describing: self.chat))")
        }
        
        let item = chat.messeges.count - 1
        let indexPath = IndexPath(item: item, section: 0)
        
        self.messagesCollectionView.insertItems(at: [indexPath])
        self.messagesCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
    
    
    func displayCurrentChat(chat: Chat) {
        self.chat = chat
        let messages = ["Пока будет вот такое длинющщее сообщение ибо ориентироваться надо именно на него. всякое говно случается, но тчобы такого....",
                        "Пока будет вот такое длинющщее сообщение ибо ориентироваться надо именно на него. всякое говно случается, но тчобы такого....Пока будет вот такое длинющщее сообщение ибо ориентироваться надо именно на него. всякое говно случается, но тчобы такого....Пока будет вот такое длинющщее сообщение ибо ориентироваться надо именно на него. всякое говно случается, но тчобы такого...."]
        self.chat?.messeges.append(contentsOf: [Messege(id: "15", text: messages.first!, date: Date()),
                                                Messege(id: "13", text: messages.last!, date: Date()),
                                                Messege(id: "12", text: "маленькое сообщение", date: Date()),
                                                Messege(id: "12", text: "...", date: Date()),
                                                Messege(id: "22", text: "я", date: Date())])
    }
    
}

extension CurrentChatViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chat?.messeges.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageViewCell.identifier, for: indexPath) as! MessageViewCell
        
        cell.message.text = chat?.messeges[indexPath.row].text
        
        if let message = chat?.messeges[indexPath.row].text {

            let rect = estimatedFrame(for: message)
            //TODO: нифигово так режется текст, нужно поправить (поправил, но нужно последить)
            if chat?.messeges[indexPath.row].id == "12" {
                cell.message.frame = CGRect(x: 40 + 8, y: 0, width: rect.width, height: rect.height)
                cell.textBubbleView.frame = CGRect(x: 40, y: 0, width: rect.width + 8 + 8, height: rect.height + 4)
                cell.textBubbleView.backgroundColor = UIColor.yellow
                cell.message.textColor = UIColor.black
                cell.photo.isHidden = false
            } else {
                cell.message.frame = CGRect(x: view.frame.width - rect.width - 8 - 8, y: 0, width: rect.width, height: rect.height)
                cell.textBubbleView.frame = CGRect(x: view.frame.width - rect.width - 8 - 16, y: 0, width: rect.width + 8, height: rect.height + 4)
                cell.textBubbleView.backgroundColor = UIColor.purple
                cell.message.textColor = UIColor.white
                cell.photo.isHidden = true
            }
        }
        
        return cell
    }
    
}
extension CurrentChatViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let message = chat?.messeges[indexPath.row].text {
            let rect = estimatedFrame(for: message)
            return CGSize(width: view.frame.width, height: rect.height)
        }
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
}
extension CurrentChatViewController: UICollectionViewDelegate {
    //TODO: подумать, что здесь можно замутить
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        inputTextField.endEditing(true)
        inputTextField.resignFirstResponder()
        scrollsCollectionViewToBottom(animated: true)
    }
}

//MARK: Private helper methods
extension CurrentChatViewController {
    
    private func estimatedFrame(for text: String) ->CGRect {
        var height: CGFloat = 40.0
        var width: CGFloat = 20.0
        
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesLineFragmentOrigin

        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0)], context: nil)
        if estimatedFrame.height >= 40.0 {
            height = estimatedFrame.height
        }
        if estimatedFrame.width >= 20.0 {
            width = estimatedFrame.width
        }
        return CGRect(x: estimatedFrame.minX, y: estimatedFrame.minY, width: width, height: height)
    }
    
    func scrollsCollectionViewToBottom(animated: Bool) {
        let indexPath = IndexPath(row: messagesCollectionView.numberOfItems(inSection: 0) - 1, section: 0)
        self.messagesCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: animated)
    }
    
}

