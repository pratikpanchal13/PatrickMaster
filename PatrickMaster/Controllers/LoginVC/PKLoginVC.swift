//
//  PKLoginVC.swift
//  PatrickMaster
//
//  Created by indianic on 17/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import Alamofire
import MMDrawerController

class PKLoginVC: UIViewController {

    //---------------------------------------------------
    //MARK: - Variable Declaration For ModelObject
    //---------------------------------------------------
    var objPKLoginModel : PKLoginModel?
    var objPKScreens :  [PKScreens]?
    var objPKAvailableModules : [PKAvailableModules]?
    

    //---------------------------------------------------
    //MARK: - Outlets
    //---------------------------------------------------
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
  
    
    //---------------------------------------------------
    //MARK: - View Life Cycle
    //---------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    //---------------------------------------------------
    //MARK: - Button Action Event
    //---------------------------------------------------
    @IBAction func btnLoginClicked(_ sender: Any) {
        
        self.CallAPIToLogin()

//        self.validationCheck()   // For Validation Checking
        
    }
    
    //---------------------------------------------------
    //MARK: - VAlidation Check
    //---------------------------------------------------
    func validationCheck(){
        
        guard let userName  = self.txtName.text , userName != "" else{
            print("Please Enter Name")
            UIAlertController.showAlertWithOkButton(self, aStrMessage: "Pls Eneter Username.", completion: nil)

            return
        }

        guard let passwrod  = self.txtPassword.text , passwrod != "" else{
            print("Please Enter Password")
            UIAlertController.showAlertWithOkButton(self, aStrMessage: "Pls Eneter Password.", completion: nil)

            return
        }
        self.CallAPIToLogin()

    }
    
    //---------------------------------------------------
    //MARK: - API CALL Login
    //---------------------------------------------------
    func CallAPIToLogin()
    {
        
        let loginAPIUrl = "http://212.118.26.115/FileworxMobileServer/api/Account/Login"
//        let aParameter: [String: Any] = ["userName": self.txtName.text!, "Password":self.txtPassword.text!,"LastLoginLanguageID":"1","AuthenticationType":"0"];
        
        let aParameter: [String: Any] = ["userName": "root", "Password":"root","LastLoginLanguageID":"1","AuthenticationType":"0"];

        
        KPAPIManager.POST(loginAPIUrl, param:aParameter, controller: self, successBlock: { (jsonResponse) in
            
            print("success response is received")
            self.objPKLoginModel = PKLoginModel(json: jsonResponse)
            
//            self.objPKAvailableModules  = self.objPKLoginModel?.data?.availableModules
//            self.objPKScreens = self.objPKAvailableModules?[0].screens
            
            if self.objPKLoginModel?.result == 0
            {
//                let storyboard = UIStoryboard(storyboard:.Messages)
//                let viewController: PKMessageVC = storyboard.instantiateViewController()
//                self.navigationController?.pushViewController(viewController, animated: true)
                
//                FWUtilityDrawer().loginToDrawerFrom(self, animated: false)
                self.openSideMenu()

            }
            
        })
        {(error, isTimeOut) in
            print("Getting Error")
        }
    }

    
    func openSideMenu(){
        
        
        let storyboardMessages = UIStoryboard(storyboard:.Messages)
        let storyboardSideMenu = UIStoryboard(storyboard:.main)

//        let storyboardDashBoard = UIStoryboard(name: "SideMenu", bundle: nil)
//        let storyboardDashBoard2 = UIStoryboard(name: "Messages", bundle: nil)

        let leftDrawer = storyboardSideMenu.instantiateViewController(withIdentifier: "FWLeftSideMenu")
        
        let centerVC = storyboardMessages.instantiateViewController(withIdentifier: "PKMessageVC")
        let drawerController = MMDrawerController.init(center: centerVC, leftDrawerViewController: leftDrawer)
        
        drawerController?.shouldStretchDrawer = false
        drawerController?.openDrawerGestureModeMask = .init(rawValue: 2)
        
        drawerController?.setMaximumLeftDrawerWidth(300, animated: false, completion: nil)
        drawerController?.restorationIdentifier = "MMDrawer"
        drawerController?.closeDrawerGestureModeMask = .all
        drawerController?.showsShadow = false
        self.navigationController?.pushViewController(drawerController!, animated: true)
    }
    
    
    
}



