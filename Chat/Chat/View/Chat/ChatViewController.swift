//
//  ChatViewController.swift
//  Chat
//
//  Created by Illya Gurkov on 2.11.22.
//

import UIKit
import MessageKit
import InputBarAccessoryView


struct Sender: SenderType{
    var senderId: String
    var displayName: String
}

struct Message: MessageType{
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    
}


class ChatViewController: MessagesViewController {

    var chatID: String?
    var otherId: String?
    
    let service = Service.shared
    let selfSender = Sender(senderId: "1", displayName: "")
    let otherSender = Sender(senderId: "2", displayName: "")
    
 var messages = [Message]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        showMessageTimestampOnSwipeLeft = true
        
        
        
        if chatID == nil {
            service.getConvoId(otherId: otherId!) { [weak self] chatId in
                self?.chatID = chatId
                self?.getMessages(convoId: chatId)
            }
            
        }
        
    }
    
    func getMessages(convoId: String){
        service.getAllMessage(chatId: convoId) {[weak self] messages in
            self?.messages = messages
            self?.messagesCollectionView.reloadDataAndKeepOffset()
        }
    }
    
    
}
extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate, MessagesDataSource{
    var currentSender: MessageKit.SenderType {
        return selfSender
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
}
extension ChatViewController: InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let msg = Message(sender: selfSender, messageId: "", sentDate: Date(), kind: .text(text))
        
        
        messages.append(msg)
        service.sendMEssage(otherId: self.otherId, convoId: self.chatID, text: text) {[weak self] convoId in
            DispatchQueue.main.async {
                inputBar.inputTextView.text = nil
                self?.messagesCollectionView.reloadDataAndKeepOffset()
            }
            self?.chatID = convoId
        }
    }
}
