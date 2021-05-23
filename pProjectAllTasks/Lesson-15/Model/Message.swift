//
//  Message.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 13.05.2021.
//

import Foundation

struct Message {
    
    let sender: String
    let body: String
}

extension Message {
    init?(documentData: [String: Any]) {
        guard let messageSender = documentData[Constants.FStore.senderField] as? String,
              let messageBody = documentData[Constants.FStore.bodyField] as? String else {
            return nil
        }
        
        sender = messageSender
        body = messageBody
    }
}

