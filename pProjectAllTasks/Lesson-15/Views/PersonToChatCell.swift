//
//  PersonToChatCell.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 23.05.2021.
//

import UIKit
//import Firebase
//import GoogleSignIn

class PersonToChatCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureLabelOfTheCell(personUsername: String/*Message*/, cell: PersonToChatCell) -> PersonToChatCell {
        
        cell.accessoryType = .disclosureIndicator
        
        cell.usernameLabel.text = personUsername//.sender
        return cell
    }
}
