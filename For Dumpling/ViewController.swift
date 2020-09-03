//
//  ViewController.swift
//  For Dumpling
//
//  Created by Shawn Cho on 4/7/20.
//  Copyright © 2020 Shawn Cho. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("loaded")

    }

    @IBAction func tester(_ sender: Any) {
        print("test")
        self.performSegue(withIdentifier: "PictureViewSegue", sender: self)
    }
    
    @IBAction func tester2(_ sender: Any) {
        print("test2")
        self.performSegue(withIdentifier: "ClockViewSegue", sender: self)

    }
    @IBAction func tester3(_ sender: Any) {
        print("test3")
        self.performSegue(withIdentifier: "MosaicViewSegue", sender: self)
    }
    @IBAction func easterEgg(_ sender: Any) {
        let pathToSound = Bundle.main.path(forResource: "loveYou", ofType: "wav" )!
        let uuurl = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: uuurl)
            audioPlayer?.play()
        } catch {
            
        }
            

        print("test4")
    }
}

