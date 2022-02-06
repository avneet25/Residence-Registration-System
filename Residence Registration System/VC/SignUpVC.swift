//
//  SignUpVC.swift
//  Residence Registration System
//
//  Created by Avneet Kaur on 2021-09-22.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpVC: UIViewController {
    
    @IBOutlet weak var nameTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var ReEnterPasswordTxtField: SkyFloatingLabelTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.designInit()
        }
    }
    
    func designInit() {
        nameTxtField.setDesign(titleName: "Full Name", placeHolder: "Full Name")
        emailTxtField.setDesign(titleName: "Email", placeHolder: "Email")
        passwordTxtField.setDesign(titleName: "Password", placeHolder: "Password")
        ReEnterPasswordTxtField.setDesign(titleName: "Re-Enter Password", placeHolder: "Re-Enter Password")
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
