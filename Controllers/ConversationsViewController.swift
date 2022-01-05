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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .done, target:self, action: #selector(profileVCTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(adduserAction))

        
       }
        // Do any additional setup after loading the view.

    @objc func profileVCTapped() {
        
        let profilevc = self.storyboard?.instantiateViewController(identifier: "profilID") as! profilVC
        self.navigationController?.pushViewController(profilevc, animated: true)
        
    }
    
    @objc func adduserAction() {
        
        let loginVC = self.storyboard?.instantiateViewController(identifier: "newconv") as! NewConversation
                let nav = UINavigationController(rootViewController: loginVC)
              //  nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
    }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
           // let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
          //  if !isLoggedIn {
              
          DispatchQueue.main.async {
            if Auth.auth().currentUser == nil {
                let loginVC = self.storyboard?.instantiateViewController(identifier: "signInID") as! LoginViewController
                        let nav = UINavigationController(rootViewController: loginVC)
                    
                self.present(nav, animated: false)
                    }
          }
             
        }
               
                   
        }
                    
  




