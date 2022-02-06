//
//  TableViewCell.swift
//  Residence Registration System
//
//  Created by Avneet Kaur on 2021-09-29.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
  
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK: Collectionview delegatess
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (self.frame.width - 66)/2, height: ((self.frame.width - 66)/2) + 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CollectionViewCell
        
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.masksToBounds = true
    
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = false
        
        // Apply a shadow
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.10
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        let arr = residenceArr[collectionView.tag]
        let parti = arr[0]
        let roomType = parti["room_type"] as! [[[String:Any]]]
        
        let parti_room = roomType[indexPath.row]
        let room = parti_room[0]
        
        cell.roomName.text = room["name"] as! String
        let img = (room["img"] as! [String])[0]
        
        cell.roomImgView.sd_setImage(with: URL(string: img), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let arr = residenceArr[collectionView.tag]
        let parti = arr[0]
        let roomType = parti["room_type"] as! [[[String:Any]]]
        
        let parti_room = roomType[indexPath.row]
        let room = parti_room[0]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "desc"), object: nil, userInfo: room)
        
    }

}
