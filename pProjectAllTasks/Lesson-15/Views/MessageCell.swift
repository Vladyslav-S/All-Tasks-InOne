//
//  MessageCell.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 13.05.2021.
//

import UIKit
import Firebase
//import GoogleSignIn

class MessageCell: UITableViewCell {

    @IBOutlet private weak var messageBuble: UIView!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var rightImageView: UIImageView!
    @IBOutlet private weak var leftImageView: UIImageView!
    
    // hide
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBuble.layer.cornerRadius = messageBuble.frame.size.height / 5
        
        label.transform = CGAffineTransform(rotationAngle: (-.pi))
        label.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        rightImageView.transform = CGAffineTransform(rotationAngle: (-.pi))
        leftImageView.transform = CGAffineTransform(rotationAngle: (-.pi))
        rightImageView.transform = CGAffineTransform(scaleX: 1, y: -1)
        leftImageView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureView(_ message: Message) {
        
        label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
        leftImageView.alpha = 0
            rightImageView.alpha = 1
        
            messageBuble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            label.textColor = UIColor(named: Constants.BrandColors.purple)
        }
        // this is a message from another sender
        else {
            leftImageView.alpha = 1
            rightImageView.alpha = 0
            
            messageBuble.backgroundColor = UIColor(named: Constants.BrandColors.purple)
            label.textColor = UIColor(named: Constants.BrandColors.lightPurple)
        }
    }
    func emptyTextView(_ textView: UITextView) {
        textView.text = ""
    }
    
    private func removeAllConstraints() {
        removeConstraints(leftImageView.constraints)
        removeConstraints(rightImageView.constraints)
        removeConstraints(messageBuble.constraints)
    }
}
