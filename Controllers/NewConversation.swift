//
//  NewConversation.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 04/01/2022.
//

import UIKit
import JGProgressHUD
//addUserCell
class NewConversation: UIViewController {
    
    private let spinner = JGProgressHUD(style: .dark)
    
    private let searchBar: UISearchBar = {
           let searchBar = UISearchBar()
           searchBar.placeholder = "Search for Users..."
           return searchBar
       }()
    
    @IBOutlet weak var tabelview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                                   style: .done,
                                                                   target: self,
                                                                   action: #selector(dismissSelf))
        searchBar.becomeFirstResponder()
    }
    
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

  

}
