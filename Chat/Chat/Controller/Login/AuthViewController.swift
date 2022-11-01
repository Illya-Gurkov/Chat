//
//  AuthViewController.swift
//  Chat
//
//  Created by Illya Gurkov on 29.10.22.
//

import UIKit

class AuthViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!
    var service = Service.shared
    var tapGest: UITapGestureRecognizer?
    var checkField = CheckField.shared
    var userDefault = UserDefaults.standard
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
    }
  
    @objc func endEditing(){
        self.view.endEditing(true)
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
    }
    
    
    @IBAction func authBtn(_ sender: Any) {
        if checkField.validField(emailView, emailTF),
           checkField.validField(passwordView, passwordTF){
            let authData = LoginField(email: emailTF.text!, password: passwordTF.text!)
            
            service.authInApp(authData) {[weak self] responce in
                switch responce {
                case .success:
                    self?.userDefault.set(true, forKey: "isLogin")
                    self?.delegate.startApp()
                    self?.delegate.closeVC()
                case .noVerify:
                    let alert = self?.alertAction("Error", "Вы не верифицировали свой email. На вашу почту отправлена ссылка!")
                    let verefyBtn = UIAlertAction(title: "OK", style: .cancel)
                    alert?.addAction(verefyBtn)
                    self?.present(alert!, animated: true)
                case .error:
                    let alert = self?.alertAction("Error", "Email или пароль не действителен")
                    let verefyBtn = UIAlertAction(title: "OK", style: .cancel)
                    alert?.addAction(verefyBtn)
                    self?.present(alert!, animated: true)
                }
            }
        }
        else {
            let alert = self.alertAction("Error", "Проверьте введенные данные")
            let verefyBtn = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(verefyBtn)
            self.present(alert, animated: true)
        }
    }
    
    func alertAction(_ header: String?, _ message: String?) -> UIAlertController{
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        
        return alert
    }
    
    
    @IBAction func closeVC(_ sender: Any) {
        delegate.closeVC()
    }
    
}
