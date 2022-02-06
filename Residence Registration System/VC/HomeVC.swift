//
//  HomeVC.swift
//  Residence Registration System
//
//  Created by Avneet Kaur on 2021-09-29.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var navBarHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var curvedView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeightConstant: NSLayoutConstraint!
 
    var categoryDict = [String:Any]()
    var roomDict = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(descAction(noti:)), name: NSNotification.Name.init(rawValue: "desc"), object: nil)
        
        designInit()
        getResidenceData()
    }
    
    @objc func descAction(noti:Notification) {
        let dict = noti.userInfo as! [String:Any]
        roomDict = dict
        self.performSegue(withIdentifier: "descSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "descSegue" {
            let vc = segue.destination as! DescVC
            vc.roomDict = roomDict
        }
    }
    
    func designInit(){
        
        tableView.rowHeight = ((tableView.frame.width - 66)/2) + 32 + 60
        tableView.tableFooterView = UIView()
        
        curvedView.roundCorners(corners: [.topLeft,.topRight], radius: 32)
        
        searchBar.searchTextField.backgroundColor = .clear
        searchBar.backgroundImage = UIImage()
    }
    
    //MARK: Tableview delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return residenceArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let arr = residenceArr[section]
//        let parti = arr[0]
//        let categoryName = parti["category"] as! String
//        return categoryName
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 16, y: 0, width: self.view.frame.width - 32, height: 50)
        
        let arr = residenceArr[section]
        let parti = arr[0]
        let categoryName = parti["category"] as! String
        
        label.text = categoryName
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor.init(named: "Color")

        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "residenceCell", for: indexPath) as! TableViewCell
        
        cell.collectionView.tag = indexPath.section
        return cell
    }
    
    
    func getResidenceData() {
        if let path = Bundle.main.path(forResource: "residence", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                print(jsonResult)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    let dict = jsonResult as! [String:Any]
                    let arr = dict["main"] as! [[[String:Any]]]
                    residenceArr = arr
                    tableView.reloadData()
                    self.view.layoutIfNeeded()
                    
                    let height = self.tableView.contentSize.height
                    scrollViewHeightConstant.constant = height
                    self.view.layoutIfNeeded()
                }
            } catch(let error) {
                // handle error
                print(error)
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        if !UIDevice.current.hasNotch {
            navBarHeightConstant.constant = 98
            self.view.layoutIfNeeded()
        }
    }
    
  
}
