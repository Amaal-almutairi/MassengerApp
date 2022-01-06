//
//  ViewController.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 30/12/2021.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class LoginViewController: UIViewController {
    
    private let spinner = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Firebase Login / check to see if email is taken
        // try to create an account
        if Auth.auth().currentUser?.uid != nil {
            goToConversation()
        }
    }
    
    @IBOutlet weak var msgLbl: UILabel!
    
    @IBOutlet weak var logoIMG: UIImageView!
    
    @IBOutlet weak var emailLbl: UITextField!
    
    @IBOutlet weak var passwordLbl: UITextField!
    
    
    
    @IBAction func loginbtn(_ sender: Any) {
        loginButton()
        if let email = emailLbl.text,let password = passwordLbl.text {
            
            spinner.show(in: view)
            
            Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] authResult , error  in
                
                guard let strongSelf = self else {
                    return
                }
                
                guard let result = authResult, error == nil else {
                    print("Error creating user: \(error?.localizedDescription)")
                    return
                }
                
                let user = result.user
                DispatchQueue.main.async {
                    
                    let VC = strongSelf.storyboard?.instantiateViewController(withIdentifier: "convId") as! ConversationsViewController
                    let navVC = UINavigationController(rootViewController: VC)
                    VC.title = "Chat"
                    navVC.modalPresentationStyle = .fullScreen
                    strongSelf.present(navVC, animated: true)
                    strongSelf.spinner.dismiss()
                    print("log in User succssfully: \(user)")
                }
                
            })
            
        }
    }
    
    func goToConversation(){
        DispatchQueue.main.async {
           let VC = self.storyboard?.instantiateViewController(withIdentifier: "convId") as! ConversationsViewController
           VC.title = "Create Account"
           self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    @IBAction func loginfacebook(_ sender: UIButton) {
        goToConversation()
   }
    
    @IBAction func Regbtn(_ sender: UIButton) {
       
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterID") as! RegisterViewController
        VC.mydelegate = self
        VC.title = "Create Account"
        self.navigationController?.pushViewController(VC, animated: true)
        
//ظظself.present(VC, animated: true, completion: nil)
    }

   
    


    


    // validation
    func loginButton() {
        
       
        
        emailLbl.resignFirstResponder()
        passwordLbl.resignFirstResponder()

            guard let email = emailLbl.text, let password = passwordLbl.text,
                !email.isEmpty, !password.isEmpty, password.count >= 8 else {
                  //  userAlert()
        
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
/*
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
*/


extension LoginViewController:RegisterDelegate {
    func rgisterSuccss() {
        
        goToConversation()
    }
    
}
