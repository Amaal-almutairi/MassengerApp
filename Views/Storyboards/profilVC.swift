//
//  profilVC.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 02/01/2022.
//

import UIKit
import FirebaseAuth
class profilVC: UIViewController {
  
    @IBOutlet weak var imgeProfil: UIImageView!
    

    @IBOutlet weak var userLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func logoutbtn(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
       } catch let signOutError as NSError {
           DispatchQueue.main.async {
               let VC = self.storyboard?.instantiateViewController(withIdentifier: "signInID") as! ConversationsViewController
               VC.title = " log out succssfully"
               self.navigationController?.pushViewController(VC, animated: true)
           
           }
          
         print("Error signing out: %@", signOutError)
       }
         
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
