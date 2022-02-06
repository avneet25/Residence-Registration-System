//
//  LoginVC.swift
//  Residence Registration System
//
//  Created by Avneet Kaur on 2021-09-21.
//

import UIKit
import SkyFloatingLabelTextField

class LoginVC: UIViewController {
    
  
    @IBOutlet weak var emailTxtField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //to keep the UI updated
        DispatchQueue.main.async {
            self.designInit()
        }
    }
    
    func designInit() {
        emailTxtField.setDesign(titleName: "Email", placeHolder: "Email")
        passwordTxtField.setDesign(titleName: "Password", placeHolder: "Password")
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        self.performSegue(withIdentifier: "homeSegue", sender: nil)
    }
    

}

