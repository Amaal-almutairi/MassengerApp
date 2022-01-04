//
//  ConversationsViewController.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 02/01/2022.
//

import UIKit
import FirebaseAuth
class ConversationsViewController: UIViewController {

    @IBOutlet weak var tabelview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chats"

        
       }
        // Do any additional setup after loading the view.

    @IBAction func adduserAction(_ sender: UIBarButtonItem) {
        
        let loginVC = self.storyboard?.instantiateViewController(identifier: "newconv") as! NewConversation
                let nav = UINavigationController(rootViewController: loginVC)
              //  nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
    }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
            if !isLoggedIn {
                // present login view controller
               /*
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
                
                */
                DispatchQueue.main.async {
                if Auth.auth().currentUser == nil {
                    let loginVC = self.storyboard?.instantiateViewController(identifier: "signInID") as! LoginViewController
                            let nav = UINavigationController(rootViewController: loginVC)
                          //  nav.modalPresentationStyle = .fullScreen
                    self.present(nav, animated: false)
                        }
                }
            }
        }
    }




