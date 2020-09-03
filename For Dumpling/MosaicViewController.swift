//
//  PictureViewController.swift
//  For Dumpling
//
//  Created by Shawn Cho on 4/7/20.
//  Copyright © 2020 Shawn Cho. All rights reserved.
//

import UIKit
import AVKit

class MosaicViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imgv:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("loaded")
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 10.0
    }

    @IBOutlet weak var scrollView: UIScrollView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgv
    }
    
}
