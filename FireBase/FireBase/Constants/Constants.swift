//
//  Constants.swift
//  FireBase
//
//  Created by Kaplan2 on 31/05/23.
//

import UIKit

struct constants {
    static let cellIdentifier = "ReusableCell"
    static let messageCell = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    static let imageCell = "ImageCell"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }    
}
struct FStore {
    static let collectionName = "messages"
    static let senderField = "sender"
    static let bodyField = "body"
    static let dateField = "date"
    static let image = "avuData"
}

enum MessageType: String {
    case text = "TEXT"
    case image = "IMAGE"
    case both = "BOTH"
    
    func key() -> String {
        return self.rawValue
    }
}
