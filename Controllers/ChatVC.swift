//
//  ChatVC.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 03/01/2022.
//

import UIKit
import MessageKit



struct Message: MessageType {
    
    public var sender: SenderType // sender for each message
    public var messageId: String // id to de duplicate
    public var sentDate: Date // date time
    public var kind: MessageKind // text, photo, video, location, emoji
}

struct Sender: SenderType {
    public var photoURL: String // extend with photo URL
    public var senderId: String
    public var displayName: String
    
    
}

class ChatVC: MessagesViewController {
    
    private var messages = [Message]()
    
    private let selfSender = Sender(photoURL: "", senderId: "1", displayName: "Amaal")
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello word message.")))
        
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello word message. Hello word message. Hello word message.")))
        
        
        
        messagesCollectionView.messagesDataSource = self
               messagesCollectionView.messagesLayoutDelegate = self
               messagesCollectionView.messagesDisplayDelegate = self
          
        
      
    }
   

    
}
extension ChatVC: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    func currentSender() -> SenderType {
        // show the chat bubble on right or left?
            return selfSender
        }
    
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section] // message kit framework uses section to separate every single message
        // a message on screen might have mulitple pieces (cleaner to have a single section per message)
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
       return messages.count
    }
    
    
}
