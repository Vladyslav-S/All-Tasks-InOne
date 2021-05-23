//
//  Constants.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 12.05.2021.
//

import Foundation

struct Constants {
    
    static let appName = "⚡️FlashChat"
    static let personChatCellIdentifier = "PersonToChatCell"
    static let personChatCellNibName = "PersonToChatCell"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    static let chooseSegue = "ChooseToChat"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
