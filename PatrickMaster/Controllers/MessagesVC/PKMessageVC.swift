//
//  PKMessageVC.swift
//  PatrickMaster
//
//  Created by indianic on 17/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import MMDrawerController

class PKMessageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnSideMenu(_ sender: Any) {
        self.mm_drawerController?.toggle(.left, animated: true, completion: nil)

    }
}
