//
//  scanCardVC.swift
//  Residence Registration System
//
//  Created by Avneet Kaur on 2021-11-18.
//

import UIKit
import CardScan
import MTSlideToOpen

class scanCardVC: UIViewController, ScanDelegate, MTSlideToOpenDelegate {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var slideToPay: MTSlideToOpenView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        designInit()
    }
    
    func designInit(){
        bottomView.roundCorners(corners: [.topLeft, .topRight], radius: 28)
        slideToPay.sliderViewTopDistance = 0
        slideToPay.sliderCornerRadius = 28
        slideToPay.thumnailImageView.backgroundColor  = UIColor.init(named: "Color")
        slideToPay.backgroundColor = UIColor.init(named: "Color")?.withAlphaComponent(0.3)
        
        slideToPay.draggedView.backgroundColor = UIColor.init(named: "Color")
        slideToPay.delegate = self
        slideToPay.thumbnailViewStartingDistance = 20
        slideToPay.textColor = UIColor.white
        slideToPay.labelText = "Slide to Pay"
        slideToPay.textFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
        slideToPay.thumnailImageView.image = UIImage.init(named: "ic_arrow")
    }

    @IBAction func scanBtnClicked(_ sender: Any) {
        guard let vc = ScanViewController.createViewController(withDelegate: self) else {
                    print("This device is incompatible with CardScan")
                    return
                }
                self.present(vc, animated: true)
    }
    
    func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
        let number = creditCard.number
        let expiryMonth = creditCard.expiryMonth
        let expiryYear = creditCard.expiryYear
        let name = creditCard.name
        let cvv = creditCard.cvv
        
    }
    
    func userDidCancel(_ scanViewController: ScanViewController) {
        self.dismiss(animated: true)
    }
    
    func userDidSkip(_ scanViewController: ScanViewController) {
        self.dismiss(animated: true)
    }
    
    func mtSlideToOpenDelegateDidFinish(_ sender: MTSlideToOpenView) {
        self.dismiss(animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
}
