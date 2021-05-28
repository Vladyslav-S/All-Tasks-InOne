//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
//import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
//        if let email = emailTextField.text, let password = passwordTextfield.text {
//
//            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                if let e = error {
//                    print(e.localizedDescription)
//                } else {
//                    self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
//                }
//            }
//        }
        
        
        handelLogin()
        
    }

    
    func handelLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error)
                return
            }
            //succsesfully logged in user
            self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
            //self.messagesController?.fetchUserAndSetNavBarTitle()
            //self.dismiss(animated: true, completion: nil )
        }
    }

}
