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
        
        loginButton()
        
 
    
         
    }
    
    @IBAction func loginfacebook(_ sender: UIButton) {
        
        
           let VC = self.storyboard?.instantiateViewController(withIdentifier: "convId") as! ConversationsViewController
           VC.title = "Create Account"
           self.navigationController?.pushViewController(VC, animated: true)
       
        
    }
    
    @IBAction func Regbtn(_ sender: UIButton) {
       
          let VC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterID") as! RegisterViewController
          VC.title = "Create Account"
          self.navigationController?.pushViewController(VC, animated: true)
      
    }

   
    


    


    // validation
    func loginButton() {
        
       
        
        emailLbl.resignFirstResponder()
        passwordLbl.resignFirstResponder()

            guard let email = emailLbl.text, let password = passwordLbl.text,
                !email.isEmpty, !password.isEmpty, password.count >= 8 else {
                    userAlert()
        
                    return
                  
            }
        // this is alert to complete all info
        
        func userAlert() {
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
            loginButton()
        }

        return true
    }
}
