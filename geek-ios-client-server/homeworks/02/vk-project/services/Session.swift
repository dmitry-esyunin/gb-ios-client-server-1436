//
//  Session.swift
//  geek-ios-client-server
//
//  Created by Dmitry Esyunin on 29.08.2021.
//

import Foundation

final class Session {
    
    private init() {}
    
    static let shared = Session()
    
   
    var token: String = "23d65573-9581-4aa4-8f64-8b2a41f8e18c"
    var userID: String = "1000"
}


