//
//  MessageCell.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 13.05.2021.
//

import UIKit
import Firebase

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
    
    
    func configureViewOfTheCell(_ message: Message, _ cell: MessageCell) -> MessageCell {
        
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.alpha = 0
            cell.rightImageView.alpha = 1
        
            cell.messageBuble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
            
        }
        // this is a message from another sender
        else {
            cell.leftImageView.alpha = 1
            cell.rightImageView.alpha = 0
            
            cell.messageBuble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        return cell
    }
    func emptyTextField(_ textField: UITextField) {
        textField.text = ""
    }
    
    private func removeAllConstraints() {
        
        removeConstraints(leftImageView.constraints)
        removeConstraints(rightImageView.constraints)
        removeConstraints(messageBuble.constraints)

    }
    
}
