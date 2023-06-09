//
//  Message.swift
//  FireBase
//
//  Created by Kaplan2 on 31/05/23.
//

import Foundation

struct Messages {
    var sender: String?
    var body: String?
    var messageType: String?
    var imagedata: Data?
   
    init(json: [String:Any]) {
        if let body = json["body"] as? String {
            self.body = body
        }
        if let imagedata = json["avuData"] as? Data {
            self.imagedata = imagedata
        }
        if let sender = json["sender"] as? String {
            self.sender = sender
        }
    }
    
    init() {
        
    }
}
