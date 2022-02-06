//
//  DescVC.swift
//  Residence Registration System
//
//  Created by Avneet Kaur on 2021-09-30.
//

import UIKit

class DescVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var roomDesc: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var priceInfoLbl: UILabel!
    
    var newImageView = UIImageView()
    var roomDict = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async { [self] in
            
            bottomView.roundCorners(corners: [.topLeft,.topRight], radius: 25)
            
            let imgs = roomDict["img"] as! [String]
            print(imgs)
            pageControl.numberOfPages = imgs.count
            if pageControl.numberOfPages <= 1 {
                pageControl.isHidden = true
            }
            
            let name = roomDict["name"] as! String
            roomName.text = name
            
            let price = roomDict["price"] as! Int
            
            
            let activity_fee = roomDict["act_fee"] as! Int
            
            let total_fee = price + activity_fee
            
            var formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 0;
            let result = formatter.string(from: NSNumber.init(value: total_fee))!
            
            priceLbl.text = "\(result)"
            
            let isMeal = roomDict["isMeal"] as! Int
            if isMeal != 0 {
                priceInfoLbl.text = "✓ Mandatory meal plan included\n✓ Activity fee included ($\(activity_fee))"
            }
            else {
                priceInfoLbl.text = "✓ Activity fee included ($\(activity_fee))"
            }
            
            var desc = "• " + (roomDict["desc"] as! String).replacingOccurrences(of: "-", with: "\n\n• ")
            roomDesc.text = desc        }
        
       
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = collectionView.contentOffset.x/collectionView.frame.width
        pageControl.currentPage = Int(index)
        
    }
    
    //MARK: Collectionview delegates
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let imgs = roomDict["img"] as! [String]
        return imgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width, height: self.view.frame.width * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCell", for: indexPath) as! CollectionViewCell
        
        let imgs = roomDict["img"] as! [String]
        let img = imgs[indexPath.row]
        
        cell.roomImgView.sd_setImage(with: URL(string: img), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imgs = roomDict["img"] as! [String]
        let img = imgs[indexPath.row]

        let imageUrl = URL(string: img)!
        let imageData = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        
        let scrollview = UIScrollView(frame: UIScreen.main.bounds)
        scrollview.alwaysBounceVertical = false
        scrollview.alwaysBounceHorizontal = false
        
        scrollview.delegate = self
        scrollview.addSubview(newImageView)
        newImageView.image = image
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage(_:)))
        scrollview.maximumZoomScale = 5.0
        scrollview.minimumZoomScale = 1.0
        scrollview.addGestureRecognizer(tap)
        
        self.view.addSubview(scrollview)
        
    }
    
    @IBAction func bookAction(_ sender: Any) {
        self.performSegue(withIdentifier: "infoSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoSegue" {
            let vc = segue.destination as! StudentInfoVC
            vc.roomDict = roomDict
        }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    

    @objc func dismissFullscreenImage (_ sender: UITapGestureRecognizer){
        sender.view?.removeFromSuperview()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return newImageView
    }
}
