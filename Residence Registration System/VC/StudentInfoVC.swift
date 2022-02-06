//
//  StudentInfoVC.swift
//  Residence Registration System
//
//  Created by Avneet Kaur on 2021-10-03.
//

import UIKit
import SkyFloatingLabelTextField

class StudentInfoVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var navBarHeightConstant: NSLayoutConstraint!
    
    @IBOutlet weak var studentIDTxtField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var nameTxtField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var genderTxtFiel: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailTxtField: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var contactTxtField: SkyFloatingLabelTextField!
    var roomDict = [String:Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.designInit()
        }
    }
    
    func designInit() {
        bottomView.roundCorners(corners: [.topLeft,.topRight], radius: 25)
        studentIDTxtField.setDesign(titleName: "Student ID", placeHolder: "Student ID")
        nameTxtField.setDesign(titleName: "Student Name", placeHolder: "Student Name")
        genderTxtFiel.setDesign(titleName: "Gender", placeHolder: "Gender")
        emailTxtField.setDesign(titleName: "Email ID", placeHolder: "abc@lakeheadu.ca")
        contactTxtField.setDesign(titleName: "Contact Number", placeHolder: "Contact Number")
    }
    
    override func viewDidLayoutSubviews() {
        if !UIDevice.current.hasNotch {
            navBarHeightConstant.constant = 66
            self.view.layoutIfNeeded()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == genderTxtFiel {
            return false
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == genderTxtFiel {
            genderTxtFiel.resignFirstResponder()
            let alertSheet = UIAlertController.init(title: "Gender", message: "", preferredStyle: .actionSheet)
            alertSheet.addAction(UIAlertAction.init(title: "Male", style: .default, handler: { maleAction in
                self.genderTxtFiel.text = "Male"
            }))
            alertSheet.addAction(UIAlertAction.init(title: "Female", style: .default, handler: { femaleAction in
                self.genderTxtFiel.text = "Female"
            }))
            alertSheet.addAction(UIAlertAction.init(title: "Other", style: .default, handler: { otherAction in
                self.genderTxtFiel.text = "Other"
            }))
            self.present(alertSheet, animated: true, completion: nil)
        }
        
    }

    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
  
    @IBAction func ContinueClicked(_ sender: Any) {
        performSegue(withIdentifier: "paymentSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paymentSegue"{
            let vc = segue.destination as! PaymentVC
            vc.roomDict = roomDict
        }
            
    }
    
}
