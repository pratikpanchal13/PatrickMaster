//
//  PhototVideoVC.swift
//  PatrickMaster
//
//  Created by indianic on 21/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

import AVFoundation
import AVKit

class PhototVideoVC: UIViewController {

    @IBOutlet weak var imgViewFullScreen: UIImageView!
    var selectedIndexImage : Int?
    var arrayContentData = [Any]()

    //FOR Playing Video
    var controller: AVPlayerViewController?
    var player : AVPlayer?

    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("Image Data\(String(describing: selectedIndexImage))")
//        print("Index Data\(arrayContentData)")
//      
        
        if selectedIndexImage == 2
        {
                self.playVideo()
        }else{
            self.setScroll()
            imgViewFullScreen.image = UIImage(named: arrayContentData[selectedIndexImage!] as! String)
        }
    }

    //MARK: -Button Action Event
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}


extension PhototVideoVC {
    
    func playVideo(){
        if ((self.player?.rate != 0) && (self.player?.error == nil) && (self.player != nil)) {
            self.player?.pause()
            return
        }
        
        if ((self.player?.pause()) != nil){
            self.player?.play()
            return
        }
        
        // navigate to ViewProfessionalProfileVC
        if self.controller != nil {
            print("stop")
            if self.player != nil {
                self.player?.pause()
            }
            self.controller?.view.removeFromSuperview()
            
        }
//        http://devstreaming.apple.com/videos/wwdc/2016/505mia12r7dwmk3aumw/505/hls_vod_mvp.m3u8
//        let url = URL(string: "http://devstreaming.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/hls_vod_mvp.m3u8")
        let url = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")


        player = AVPlayer(url: url!)
        
        controller=AVPlayerViewController()
        controller?.player=player
        
        controller?.videoGravity = AVLayerVideoGravityResizeAspect
        controller?.showsPlaybackControls = true
        //controller?.view.isUserInteractionEnabled = false
        
        controller?.view.frame = CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height-64) // self.view.frame
        self.view.addSubview((controller?.view)!)
        player?.play()
        
        self.playerFinished()
        
    }
    func playerFinished(){
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            
            self.player = nil
            self.controller?.view.removeFromSuperview()
            self.controller?.view.isUserInteractionEnabled = true
            
        }
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
