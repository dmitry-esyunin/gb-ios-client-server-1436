//
//  DetailViewController.swift
//  geek-ios-client-server
//
//  Created by Dmitry Esyunin on 22.08.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ResultUserLabel: UILabel!
    @IBOutlet weak var ResultSessionIDLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResultUserLabel.text = Singelton.shared.token
        ResultSessionIDLabel.text = String(Singelton.shared.userID)
    }
    
    

}
