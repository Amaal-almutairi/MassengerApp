//
//  ViewController.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 30/12/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var msgLbl: UILabel!
    
    @IBOutlet weak var logoIMG: UIImageView!
    
    @IBOutlet weak var emailLbl: UITextField!
    
    @IBOutlet weak var passwordLbl: UITextField!
    
    
    @IBAction func loginbtn(_ sender: Any) {
    }
    
    @IBAction func loginfacebook(_ sender: UIButton) {
    }
    
    @IBAction func Regbtn(_ sender: UIButton) {
        loginButtonTapped()
    }
    
    // validation
    func loginButtonTapped() {
        emailLbl.resignFirstResponder()
        passwordLbl.resignFirstResponder()

            guard let email = emailLbl.text, let password = passwordLbl.text,
                !email.isEmpty, !password.isEmpty, password.count >= 8 else {
                    alertUserLoginError()
                    return
            }
        // this is alert to complete all info
        
        func alertUserLoginError() {
               let alert = UIAlertController(title: "Information",
                                             message: "Please enter all information to log in.",
                                             preferredStyle: .alert)
               alert.addAction(UIAlertAction(title:"Dismiss",
                                             style: .cancel, handler: nil))
               present(alert, animated: true)
           }

    
}



}
extension LoginViewController: UITextFieldDelegate {
// this function will call if the user hit return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailLbl {
            passwordLbl.becomeFirstResponder()
        }
        else if textField == passwordLbl {
            loginButtonTapped()
        }

        return true
    }

}
