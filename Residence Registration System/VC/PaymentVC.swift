//
//  PaymentVC.swift
//  Residence Registration System
//
//  Created by Avneet Kaur on 2021-10-21.
//

import UIKit
import M13Checkbox

class PaymentVC: UIViewController {
    
    @IBOutlet weak var checkbox: M13Checkbox!
    @IBOutlet weak var roomPriceLbl: UILabel!
    @IBOutlet weak var roomNameLbl: UILabel!
    @IBOutlet weak var actPrice: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var HSTprice: UILabel!
    @IBOutlet weak var mealHgtConstant: NSLayoutConstraint!
    @IBOutlet weak var mealPrice: UILabel!
    
    var roomDict = [String:Any]()
    var tot = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealHgtConstant.constant = 0
        designInit()
        tot = Double((roomDict["price"] as! Int) + (roomDict["act_fee"] as! Int))
        getData()
    }

    func getData(){
        
        
        roomNameLbl.text = roomDict["name"] as? String
        roomPriceLbl.text = "$\(roomDict["price"] as! Int)"
        actPrice.text = "$\(roomDict["act_fee"] as! Int)"
        
        let meal = roomDict["isMeal"] as! Int
        if meal != 0 {
            checkbox.checkState = .checked
            checkbox.isUserInteractionEnabled = false
            let Tax = tot * 0.13
            HSTprice.text = String(format: "%.2f", Tax)
            totalPrice.text = "$\(tot + Tax)"
        }
        else {
            let Tax = tot * 0.13
            HSTprice.text = String(format: "%.2f", Tax)
            totalPrice.text = "$\(tot + Tax)"
        }
      
    }

   
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func designInit() {
        checkbox.stateChangeAnimation = .spiral
        checkbox.animationDuration = 0.5
    }

    @IBAction func clickCheck(_ sender: M13Checkbox) {
        
        if sender.checkState == .checked {
            mealPrice.text = "$1990"
            mealHgtConstant.constant = 40
            let tot1 = tot + 1990
            let Tax = tot1 * 0.13
            HSTprice.text = String(format: "%.2f", Tax)
            totalPrice.text = "$\(tot1 + Tax)"
        }
        else if sender.checkState == .unchecked {
            mealHgtConstant.constant = 0
            let Tax = tot * 0.13
            HSTprice.text = String(format: "%.2f", Tax)
            totalPrice.text = "$\(tot + Tax)"
        }
    }
    
    @IBAction func continueBtn(_ sender: Any) {
        performSegue(withIdentifier: "cardSegue", sender: nil)
    }
}
