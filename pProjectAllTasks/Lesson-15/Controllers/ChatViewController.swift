////
////  ChatViewController.swift
////  Flash Chat iOS13
////
////  Created by Angela Yu on 21/10/2019.
////  Copyright © 2019 Angela Yu. All rights reserved.
////

import UIKit
import Firebase
//import GoogleSignIn

class ChatViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.transform = CGAffineTransform(rotationAngle: (-.pi))
            tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
            tableView.dataSource = self
            tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        }
    }
    @IBOutlet private weak var messageTextView: UITextView! {
        didSet {
            messageTextView.layer.cornerRadius = messageTextView.frame.size.height / 5
            messageTextView.delegate = self
            messageTextView.isScrollEnabled = true
        }
    }
    @IBOutlet private var messageTextViewHeightConstraint: NSLayoutConstraint!
    
    private let db = Firestore.firestore()
    var messages: [Message] = []
    var messageCell = MessageCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        messageCell.transform = CGAffineTransform(rotationAngle: (-.pi))
        messageCell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        loadMassages()
    }
    
    func loadMassages() {
        
        db.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField).addSnapshotListener { [weak self](querySnapshot, error) in
            
            guard let strongSelf = self else { return }
            
            if let e = error {
                print("issue retrieving data from database: \(e)")
                return
            }
            guard let snapshotDocument = querySnapshot?.documents else {
                return
            }
            //            for doc in snapshotDocument {
            //                let data = doc.data()
            //                if let messageSender = data[Constants.FStore.senderField] as? String,
            //                   let messageBody = data[Constants.FStore.bodyField] as? String {
            //                    let newMessage = Message(sender: messageSender, body: messageBody)
            //                    strongSelf.messages.append(newMessage)
            //                }
            //            }
            strongSelf.messages = snapshotDocument.compactMap { Message(documentData: $0.data()) }.reversed()
            DispatchQueue.main.async {
                //strongSelf.messages = strongSelf.messages.reversed()
                strongSelf.tableView.reloadData()
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        saveMessages()
    }
    func saveMessages() {
        
        if let messageBody = messageTextView.text,
           messageBody.isEmpty == false,
           let messageSender = Auth.auth().currentUser?.email {
            db.collection(Constants.FStore.collectionName).addDocument(data: [Constants.FStore.senderField : messageSender,
                                                                              Constants.FStore.bodyField : messageBody,
                                                                              Constants.FStore.dateField : Date().timeIntervalSince1970])
            { [weak self](error) in // weak self
                
                guard let strongSelf = self else { return }
                
                if let e = error {
                    print("There was an issue saving data to firestore: \(e)")
                    return
                }
                print("Succesfully saved data")
                DispatchQueue.main.async {
                    //                    strongSelf.messageTextView.text = ""
                    strongSelf.messageCell.emptyTextView(strongSelf.messageTextView)
                    strongSelf.messageTextViewHeightConstraint.constant = 30
                }
            }
        }
        
    }
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            pop(numberOfTimes: 3)  // dismiss vievController Number of times
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

//MARK:- TableView DataSource
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.configureView(messages[indexPath.row])
        return cell
    }
}
//MARK:- textView Delegate
extension ChatViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        let rows = (messageTextView.contentSize.height - messageTextView.textContainerInset.top - messageTextView.textContainerInset.bottom) / messageTextView.font!.lineHeight
        if rows < 4 {
            let fixedWidth = messageTextView.frame.size.width
            let newSize = messageTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            var newFrame = messageTextView.frame
            newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            self.messageTextViewHeightConstraint.constant = newSize.height
            
        } else {
            let isOversize = messageTextView.contentSize.height >= messageTextViewHeightConstraint.constant
            messageTextViewHeightConstraint.isActive = isOversize
            textView.isScrollEnabled = isOversize
        }
    }
    
    
    
    /*func textViewDidBeginEditing(_ textView: UITextView) {
     if messageTextView.textColor == UIColor.lightGray {
     messageTextView.text = nil
     messageTextView.textColor = UIColor.black
     }
     }
     func textViewDidEndEditing(_ textView: UITextView) {
     
     if messageTextView.text.isEmpty {
     messageTextView.text = "Write a message..."
     messageTextView.textColor = UIColor.lightGray
     
     }
     }*/
}

// add regestration via google
// list of users after reg + another table view with users
// chat with chosen user + GlobalChat
// change width (depends )


