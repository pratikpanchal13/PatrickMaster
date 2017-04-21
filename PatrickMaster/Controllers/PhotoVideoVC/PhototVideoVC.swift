//
//  PhototVideoVC.swift
//  PatrickMaster
//
//  Created by indianic on 21/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class PhototVideoVC: UIViewController {

    @IBOutlet weak var imgViewFullScreen: UIImageView!
    var selectedIndexImage : Int?
    var arrayContentData = [Any]()

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Image Data\(String(describing: selectedIndexImage))")
        print("Index Data\(arrayContentData)")
      
        self.setScroll()
        
        imgViewFullScreen.image = UIImage(named: arrayContentData[selectedIndexImage!] as! String)
        
    }

   


    //MARK: -Button Action Event
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}


//MARK: - ScrollView Delegate
extension PhototVideoVC:UIScrollViewDelegate{

    func setScroll()
    {
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.bounces = false
        scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return imgViewFullScreen
    }
}
