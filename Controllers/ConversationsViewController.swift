//
//  ConversationsViewController.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 02/01/2022.
//

import UIKit

class ConversationsViewController: UIViewController {

    @IBOutlet weak var tabelview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
 
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
            if !isLoggedIn {
                // present login view controller
                
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
            }
        }
    }




