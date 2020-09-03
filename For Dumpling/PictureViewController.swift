//
//  PictureViewController.swift
//  For Dumpling
//
//  Created by Shawn Cho on 4/7/20.
//  Copyright © 2020 Shawn Cho. All rights reserved.
//

import UIKit
import AVKit

class PictureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("loaded")
    }

    @IBAction func videoPressed(_ sender: Any) {
        print("video Pressed")
        if let path = Bundle.main.path(forResource: "Dumpling!", ofType: "mp4") {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
    }
}
