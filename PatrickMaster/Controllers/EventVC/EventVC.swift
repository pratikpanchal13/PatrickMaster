//
//  EventVC.swift
//  PatrickMaster
//
//  Created by indianic on 21/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import SDWebImage
import AVFoundation
import AVKit


class EventVC: UIViewController {

    @IBOutlet weak var tblViewEvents: UITableView!
    
    var selectedIndex : Int?

    let aArrayImage = ["1","2","3","4","5","6","7","8","9","10","11",]
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Display_Full_Image") {
            if let aDestinationVC = segue.destination as? PhototVideoVC {
                aDestinationVC.selectedIndexImage = self.selectedIndex
                aDestinationVC.arrayContentData =  aDestinationVC.arrayContentData + aArrayImage
                
                
                print("selected index 2 = \(String(describing: self.selectedIndex))")
            }
        
        }
    
    }

}


extension EventVC :UITableViewDelegate,UITableViewDataSource{

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : EventListCell = tableView.dequeueReusableCell(withIdentifier: "EventListCell", for: indexPath) as! EventListCell
        cell.lblEventName.text = "test"
        
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EventVC.handleSingleTap(_:)))
        singleTap.numberOfTapsRequired = 1
        cell.imgViewEvents.tag = indexPath.row
        cell.imgViewEvents.isUserInteractionEnabled = true
        cell.imgViewEvents.addGestureRecognizer(singleTap)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        switch indexPath.row {
        case 2:
            var videoUrlPath : URL?
            videoUrlPath = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            self.getThumbImage(filePathServer: videoUrlPath, forCell: cell)
            break
        default:
            cell.imgViewEvents.image =  UIImage(named: aArrayImage[indexPath.row] )
            break
            
        }

        return cell
    }
    
    func getThumbImage(filePathServer:URL?, forCell cell:EventListCell ) {
        
        DispatchQueue.global(qos: .background).async {
            if(filePathServer != nil ){
                let asset = AVURLAsset(url: filePathServer!)
                let generator = AVAssetImageGenerator(asset: asset)
                generator.appliesPreferredTrackTransform = true
                
                let timestamp = CMTime(seconds: 5, preferredTimescale: 1)


                do {
                    let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)

                    DispatchQueue.main.async {
                        
                        let thumbNailImg =  UIImage(cgImage: imageRef)
                        cell.imgViewEvents.image  = thumbNailImg
                        
                    }
                }
                catch _ as NSError
                {
                    
                    cell.imgViewEvents.image  = UIImage(named: "Placeholder")

                }
                
            }
        }
    }
    
    //Single tap
    func handleSingleTap(_ sender: AnyObject) {
        
        self.selectedIndex = sender.view.tag
        self.performSegue(withIdentifier: "Display_Full_Image", sender: self)
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("index \(indexPath.row)")
    }
    
}


