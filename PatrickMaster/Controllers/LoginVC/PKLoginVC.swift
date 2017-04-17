//
//  PKLoginVC.swift
//  PatrickMaster
//
//  Created by indianic on 17/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import Alamofire

class PKLoginVC: UIViewController {

    var objPKLoginModel : PKLoginModel?

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnLoginClicked(_ sender: Any) {
     
        self.APICALLING()
        
        
        
    }
    
    
    func APICALLING()
    {

        let loginAPIUrl = "http://212.118.26.115/FileworxMobileServer/api/Account/Login"
        let aParameter: [String: Any] = ["userName": self.txtName.text!, "Password":self.txtPassword.text!,"LastLoginLanguageID":"1","AuthenticationType":"0"];

        KPAPIManager.POST(loginAPIUrl, param:aParameter, controller: self, successBlock: { (jsonResponse) in
            print("success response is received")
            print(jsonResponse)

            self.objPKLoginModel = PKLoginModel(json: jsonResponse)
           if self.objPKLoginModel?.result == 0
            {
                let storyboard = UIStoryboard(storyboard:.Messages)
                let viewController: PKMessageVC = storyboard.instantiateViewController()
                self.navigationController?.pushViewController(viewController, animated: true)

            }
            
           

       }) { (error, isTimeOut) in

            print("Getting Error")
        }
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
