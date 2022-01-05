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
  //  @IBOutlet weak var nomessage:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .done, target:self, action: #selector(profileVCTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(adduserAction))

        tabelview.isHidden = true
     //   nomessage.isHidden = true
        tabelview.delegate = self
        tabelview.dataSource = self
        fetchConversations()
       }
        // Do any additional setup after loading the view.

    @objc func profileVCTapped() {
        
        let profilevc = self.storyboard?.instantiateViewController(identifier: "profilID") as! profilVC
        self.navigationController?.pushViewController(profilevc, animated: true)
        
    }
    private func fetchConversations(){
           // fetch from firebase and either show table or label
           
           tabelview.isHidden = false
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
                    
  
extension ConversationsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "Hello"
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chatVC = ChatVC()
        let cell = tableView.cellForRow(at: indexPath)!
        chatVC.title = cell.textLabel?.text
        chatVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(chatVC, animated: true)
    }
}




