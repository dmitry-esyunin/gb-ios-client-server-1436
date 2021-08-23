//
//  Singleton.swift
//  geek-ios-client-server
//
//  Created by Dmitry Esyunin on 22.08.2021.
//

import UIKit

final class Singelton{
    
    private init() {}
    
    static let shared = Singelton()
    
   
    var token: String = "23d65573-9581-4aa4-8f64-8b2a41f8e18c"
    var userID: Int = 1000
}



