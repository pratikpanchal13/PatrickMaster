//
//  PhototVideoVC.swift
//  PatrickMaster
//
//  Created by indianic on 21/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class PhototVideoVC: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var imgViewFullScreen: UIImageView!
    var selectedIndexImage : Int?
    var arrayContentData = [Any]()

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Image Data\(String(describing: selectedIndexImage))")
        print("Index Data\(arrayContentData)")
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.bounces = false
        scrollView.delegate = self

        
        imgViewFullScreen.image = UIImage(named: arrayContentData[selectedIndexImage!] as! String)
        
        
        // Do any additional setup after loading the view.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return imgViewFullScreen
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
