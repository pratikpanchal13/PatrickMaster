//
//  DashboardVC.swift
//  PatrickMaster
//
//  Created by indianic on 20/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var viewAdvertiesment: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = "DashBoard"
        
        let view = AdvertiesmentView.instanceFromNib()
        view.frame = CGRect(x: 0, y: 0, width: self.viewAdvertiesment.frame.size.width, height: self.viewAdvertiesment.frame.size.height)
        self.viewAdvertiesment.addSubview(view)

        view.advertiesMentIndex = { index in
            
            print("Selected Index is \(index)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }
    
    @IBAction func btnMenuClicked(_ sender: Any) {
        self.mm_drawerController?.toggle(.left, animated: true, completion: nil)

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
