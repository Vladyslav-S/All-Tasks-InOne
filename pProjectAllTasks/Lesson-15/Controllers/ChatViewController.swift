////
////  ChatViewController.swift
////  Flash Chat iOS13
////
////  Created by Angela Yu on 21/10/2019.
////  Copyright © 2019 Angela Yu. All rights reserved.
////

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            
        }
    }
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var messageTextViewHeightConstraint: NSLayoutConstraint!
    
    //@IBOutlet private weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    var messageCell = MessageCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        messageTextView.layer.cornerRadius = messageTextView.frame.size.height / 5
        messageCell.transform = CGAffineTransform(rotationAngle: (-.pi))
        messageCell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        messageTextView.delegate = self
        messageTextView.isScrollEnabled = true
        
        //tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.size.width - 10)
        tableView.transform = CGAffineTransform(rotationAngle: (-.pi))
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMassages()
        
    }
    
    func loadMassages() {
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, error) in
            
            self.messages = []
            
            if let e = error {
                print("issue retrieving data from database: \(e)")
            } else {
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String,
                           let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                        }
                    }
                    DispatchQueue.main.async {
                        self.messages = self.messages.reversed()
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextView.text, messageBody.isEmpty == false, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField : messageSender,
                                                                      K.FStore.bodyField : messageBody,
                                                                      K.FStore.dateField : Date().timeIntervalSince1970])
            { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore: \(e)")
                } else {
                    print("Succesfully saved data")
                    DispatchQueue.main.async {
                        
                        self.messageTextView.text = ""
                        self.messageTextViewHeightConstraint.constant = 30
                        
                    }
                }
            }
        }
        //textViewDidEndEditing(messageTextView)
    }
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            pop(numberOfTimes: 2)  // dismiss vievController Number of times
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    private func resetTheMessageTextView() {
        
    }
}

//MARK:- TableView DataSource
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        return cell.configureViewOfTheCell(message, cell)
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


