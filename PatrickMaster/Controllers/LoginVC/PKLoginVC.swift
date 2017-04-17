//
//  PKLoginVC.swift
//  PatrickMaster
//
//  Created by indianic on 17/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class PKLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnLoginClicked(_ sender: Any) {
     
        
        let storyboard = UIStoryboard(storyboard:.Messages)
        let viewController: PKMessageVC = storyboard.instantiateViewController()

//        present(viewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
        
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
