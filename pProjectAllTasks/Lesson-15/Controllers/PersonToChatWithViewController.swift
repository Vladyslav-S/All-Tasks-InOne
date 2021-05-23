//
//  PersonToChatWithViewController.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 22.05.2021.
//

import UIKit
import Firebase
//import GoogleSignIn


class PersonToChatWithViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var personTableView: UITableView! {
        didSet {
            personTableView.register(UINib(nibName: Constants.personChatCellNibName, bundle: nil), forCellReuseIdentifier: Constants.personChatCellIdentifier)
            
            
            personTableView.delegate = self
            personTableView.dataSource = self
        }
    }
    
    let db = Firestore.firestore()
    var users: [String] = [] //[Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUsers()
    }
    
    
    func loadUsers() {
        users = []
//        db.collection(K.FStore.senderField).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, error) in
//
//            self.senders = []
//
//            if let e = error {
//                print("issue retrieving data from database: \(e)")
//            } else {
//                if let snapshotDocument = querySnapshot?.documents {
//                    for doc in snapshotDocument {
//                        let data = doc.data()
//                        if let messageSender = data[K.FStore.senderField] as? String,
//                           let messageBody = data[K.FStore.bodyField] as? String {
//                            let newMessage = Message(sender: messageSender, body: messageBody)
//                            self.senders.append(newMessage)
//                        }
//                    }
//                    DispatchQueue.main.async {
//                        self.senders = self.senders.reversed()
//                        self.personTableView.reloadData()
//                    }
//                }
//            }
//        }
        
        let user = Auth.auth().currentUser
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
//          let uid = user.uid
            let email = user.email
            users.append(email ?? "HYJ")
//          let photoURL = user.photoURL
//          var multiFactorString = "MultiFactor: "
//          for info in user.multiFactor.enrolledFactors {
//            multiFactorString += info.displayName ?? "[DispayName]"
//            multiFactorString += " "
//          }
        }
        
        
    }
    
    
    
    
    
    //MARK:- tableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = users[0]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.personChatCellIdentifier/*, for: indexPath*/) as! PersonToChatCell
        return cell.configureLabelOfTheCell(personUsername: user, cell: cell)
        
    }
    
    //MARK:- tableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        self.performSegue(withIdentifier: Constants.chooseSegue, sender: self)
    }
}
