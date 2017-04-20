//
//  AdvertiesmentView.swift
//  PatrickMaster
//
//  Created by indianic on 20/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class AdvertiesmentView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {

    let cellsPerRow:CGFloat = 1
    
    public var advertiesMentIndex:(_ index : Int)->()  = {_ in}
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var aMutArray = ["1","2","3","4","5","6","7","8","9","10","11","12","1","2","3","4","5","6","7","8","9","10","11","12"]

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func instanceFromNib() -> AdvertiesmentView {
        return UINib(nibName: "Advertiesment", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! AdvertiesmentView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let nibName = UINib(nibName: "AdvertiesmentCell", bundle:nil)
        self.collectionView.register(nibName, forCellWithReuseIdentifier: "AdvertiesmentCell")
        self.collectionView.reloadData()
    
    }
}


// MARK: - Collection view DataSource Method
extension AdvertiesmentView {
    
    // MARK: - UICollectionViewDataSource protocol
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aMutArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertiesmentCell", for: indexPath as IndexPath) as! AdvertiesmentCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.lblName.text = aMutArray[indexPath.item]
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        self.advertiesMentIndex(indexPath.row)  // Call Back Selected Index Collection view
        
    }
}

//MARK: - CollectionView Flow Layout Delegate
extension AdvertiesmentView {
 
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / cellsPerRow ) ), height: collectionView.frame.size.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


// MARK: - ScrollView Delegate
extension AdvertiesmentView {
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) // called when scroll view grinds to a halt
    {
        for cell in collectionView.visibleCells  as [UICollectionViewCell]    {
            let indexPath = collectionView.indexPath(for: cell as UICollectionViewCell)
            
            self.advertiesMentIndex((indexPath?.row)!)  // Call Back for Selected Scrolling Index
        }
    }

}

