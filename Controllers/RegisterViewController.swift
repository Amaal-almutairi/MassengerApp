//
//  RegisterViewController.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 02/01/2022.
//

import UIKit

class RegisterViewController: UIViewController{
    
 //   var FN: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var username = firstNameLbl.text
        
    }
  
 

    @IBOutlet weak var logoIMG: UIImageView!
    
    @IBOutlet weak var firstNameLbl: UITextField!
    
    @IBOutlet weak var lastNameLbl: UITextField!
    
    @IBOutlet weak var emailLbl: UITextField!
    
    @IBOutlet weak var passwordLbl: UITextField!
    
 
    @IBAction func Registerbtn(_ sender: UIButton) {
        
    }
    
    
    
    
  
}
