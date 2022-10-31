//
//  AuthViewController.swift
//  Chat
//
//  Created by Illya Gurkov on 29.10.22.
//

import UIKit

class AuthViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeVC(_ sender: Any) {
        delegate.closeVC()
    }
    
}
