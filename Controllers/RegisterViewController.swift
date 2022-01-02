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
        
      
        emailLbl.delegate = self
        passwordLbl.delegate = self
        
        logoIMG.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self,
                                                    action: #selector(didTapChangeProfilePic))
        
        logoIMG.addGestureRecognizer(gesture)
    }
  
    @objc private func didTapChangeProfilePic() {
           presentPhotoActionSheet()
       }

    @IBOutlet weak var logoIMG: UIImageView!
    
    @IBOutlet weak var firstNameLbl: UITextField!
    
    @IBOutlet weak var lastNameLbl: UITextField!
    
    @IBOutlet weak var emailLbl: UITextField!
    
    @IBOutlet weak var passwordLbl: UITextField!
    

      
        
    


    
    @IBAction func Registerbtn(_ sender: UIButton) {
      
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "profilID") as! profilVC
        
        VC.title = "Create Account"
        self.navigationController?.pushViewController(VC, animated: true)
      
    }
    
    
    
    
  
}

extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailLbl {
            passwordLbl.becomeFirstResponder()
        }
        else if textField == passwordLbl {
            registerButtonTapped()
        }

        return true
    }

}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "How would you like to select a picture?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self] _ in

                                                self?.presentCamera()

        }))
        actionSheet.addAction(UIAlertAction(title: "Chose Photo",
                                            style: .default,
                                            handler: { [weak self] _ in

                                                self?.presentPhotoPicker()

        }))

        present(actionSheet, animated: true)
    }

    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }

        self.logoIMG.image = selectedImage
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func registerButtonTapped() {
        emailLbl.resignFirstResponder()
        passwordLbl.resignFirstResponder()
        firstNameLbl.resignFirstResponder()
        lastNameLbl.resignFirstResponder()

            guard let firstName = firstNameLbl.text,
                let lastName = lastNameLbl.text,
                let email = emailLbl.text,
                let password = passwordLbl.text,
                !email.isEmpty,
                !password.isEmpty,
                !firstName.isEmpty,
                !lastName.isEmpty,
                password.count >= 8 else {
                    alertUserLoginError()
                    return
            }



}
    
    func alertUserLoginError(message: String = "Please enter all information to create a new account.") {
            let alert = UIAlertController(title: "information",
                                          message: message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Cancel",
                                          style: .cancel, handler: nil))
            present(alert, animated: true)
        }

}

