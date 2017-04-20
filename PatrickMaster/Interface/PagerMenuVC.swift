//
//  PagerMenuVC.swift
//  PatrickMaster
//
//  Created by indianic on 20/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import PageMenu

class PagerMenuVC: UIViewController,CAPSPageMenuDelegate {

    
    var pageMenu : CAPSPageMenu?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageMenu?.delegate = self

        self.setupPages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupPages() {
        let storyboard = UIStoryboard(name: "PagerMenu", bundle: nil)
//        let storyboard = UIStoryboard(storyboard:.Pagermenu)

        //  let font = UIFont(name: "Montserrat-Bold", size: 18.0)
        var controllerArray: [UIViewController] = []
        
        let firstVC  = storyboard.instantiateViewController(withIdentifier: "PagerSubMenu1") as! PagerSubMenu1
        firstVC.title = "Test Patrck VC 1"
        let firstVC2 = storyboard.instantiateViewController(withIdentifier: "PagerSubMenu2") as! PagerSubMenu2
        firstVC2.title = "Test 2"
        let firstVC3 = storyboard.instantiateViewController(withIdentifier: "PagerSubMenu3") as! PagerSubMenu3
        firstVC3.title = "Test 3"
        let firstVC4 = storyboard.instantiateViewController(withIdentifier: "PagerSubMenu1") as! PagerSubMenu1
        firstVC4.title = "Test 4"
        let firstVC5 = storyboard.instantiateViewController(withIdentifier: "PagerSubMenu1") as! PagerSubMenu1
        firstVC5.title = "Test 5"
        let firstVC6 = storyboard.instantiateViewController(withIdentifier: "PagerSubMenu1") as! PagerSubMenu1
        firstVC6.title = "Test 6"
        let firstVC7 = storyboard.instantiateViewController(withIdentifier: "PagerSubMenu1") as! PagerSubMenu1
        firstVC7.title = "Test 7"
        let firstVC8 = storyboard.instantiateViewController(withIdentifier: "PagerSubMenu1") as! PagerSubMenu1
        firstVC8.title = "Test 8"
        
        controllerArray.append(firstVC)
        controllerArray.append(firstVC2)
        controllerArray.append(firstVC3)
        controllerArray.append(firstVC4)
        controllerArray.append(firstVC5)
        controllerArray.append(firstVC6)
        
        // a bunch of random customization
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor.white),
            .selectionIndicatorColor(UIColor.red),
            .bottomMenuHairlineColor(UIColor.brown),
            .menuHeight(44.0),
            .menuItemWidth(85.0),
            .centerMenuItems(true),
            .selectedMenuItemLabelColor(UIColor.black),
            .menuItemWidthBasedOnTitleTextWidth(true),
            
            ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
        // self.view.addSubview(btnCreateEvent)
        
    }
}
