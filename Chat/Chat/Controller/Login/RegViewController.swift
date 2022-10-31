//
//  RegViewController.swift
//  Chat
//
//  Created by Illya Gurkov on 29.10.22.
//

import UIKit

class RegViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!
    var checkField = CheckField.shared
    var service = Service.shared
    
    
    
    
    @IBOutlet weak var mainView: UIView!
    
    var tapGest: UITapGestureRecognizer?
    
    @IBOutlet weak var regBtnClick: UIButton!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var repasswordView: UIView!
    
    @IBOutlet weak var rePasswordTF: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
    }
    
    @IBAction func closeVC(_ sender: Any) {
        delegate.closeVC()
    }
    
    @objc func endEditing(){
        self.view.endEditing(true)
    }
    
    
    @IBAction func regBtnClick(_ sender: Any) {
        if checkField.validField(emailView, emailTF),
           checkField.validField(passwordView, passwordTF)
           {
            if passwordTF.text == rePasswordTF.text {
                
                service.createNewUser(LoginField(email: emailTF.text!, password: passwordTF.text!)) {[weak self] code in
                    switch code.code {
                    case 0:
                        print("произошла ошибка регистрации")
                    case 1:
                        print("успешно зарегестрировались")
                        self?.service.confrimEmail()
                    default:
                        print("Неизвестная ошибка")
                    }
                }
            } else {
                print ("пароли не совпадают")
            }
            
        }
    }
    
}
