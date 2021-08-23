//
//  SendViewController.swift
//  geek-ios-client-server
//
//  Created by Dmitry Esyunin on 22.08.2021.
//

import UIKit



class SendViewController: UIViewController {

    
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var SessionID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Account = Singelton.shared
        userTextField.text = Account.token
        SessionID.text = String(Account.userID)
        
        
    }
    

    @IBAction func RunButtonAction(_ sender: Any) {
        
        
        Singelton.shared.token = userTextField.text ?? Singelton.shared.token
        
        guard let _id = SessionID.text, let int_id = Int(_id)
        else {
            return
        }
        
        Singelton.shared.userID = int_id
        
    }
    
}
