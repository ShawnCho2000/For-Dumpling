//
//  PictureViewController.swift
//  For Dumpling
//
//  Created by Shawn Cho on 4/7/20.
//  Copyright © 2020 Shawn Cho. All rights reserved.
//

import UIKit
import AVKit
//import SAConfettiView

class ClockViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var moveLabel: UILabel!
    @IBOutlet var timeButton: UIView!
    
    var birthday = 0
        
        var timer: Timer!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true) // Repeat "func Update() " every second and update the label
            
        }
        
        @objc func UpdateTime() {
            let userCalendar = Calendar.current
            let userCalendar2 = Calendar.current
            // Set Current Date
            let date = Date()
            let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: date)
            let currentDate = userCalendar.date(from: components)!
            
            // Set Event Date
            var eventDateComponents = DateComponents()
            eventDateComponents.year = 2020
            eventDateComponents.month = 04
            eventDateComponents.day = 11
            eventDateComponents.hour = 0
            eventDateComponents.minute = 00
            eventDateComponents.second = 00
            eventDateComponents.timeZone = TimeZone(abbreviation: "PST")
            
            var startDateComponents = DateComponents()
            startDateComponents.year = 2020
            startDateComponents.month = 01
            startDateComponents.day = 18
            startDateComponents.hour = 02
            startDateComponents.minute = 30
            startDateComponents.second = 00
            startDateComponents.timeZone = TimeZone(abbreviation: "PST")
            
            var moveDateComponents = DateComponents()
            moveDateComponents.year = 2020
            moveDateComponents.month = 09
            moveDateComponents.day = 23
            moveDateComponents.hour = 00
            moveDateComponents.minute = 00
            moveDateComponents.second = 00
            moveDateComponents.timeZone = TimeZone(abbreviation: "PST")
            
            // Convert eventDateComponents to the user's calendar
            let eventDate = userCalendar.date(from: eventDateComponents)!
            let startDate = userCalendar2.date(from: startDateComponents)!
            let moveDate = userCalendar.date(from: moveDateComponents)!
            
            
            // Change the seconds to days, hours, minutes and seconds
            let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
            let moveLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: moveDate)
            let timePassed = userCalendar.dateComponents([.day, .hour, .minute, .second], from: startDate, to: currentDate)
            
            // Display Countdown
            timerLabel.text = "\(timeLeft.day!)d \(timeLeft.hour!)h \(timeLeft.minute!)m \(timeLeft.second!)s"
            countLabel.text = "\(timePassed.day!)d \(timePassed.hour!)h \(timePassed.minute!)m \(timePassed.second!)s"
            moveLabel.text = "\(moveLeft.day!)d \(moveLeft.hour!)h \(moveLeft.minute!)m \(moveLeft.second!)s"
            
            // Show diffrent text when the event has passed
            endEvent(currentdate: currentDate, eventdate: eventDate)
        }
        
    @IBAction func playVideo(_ sender: Any) {
        print("video")
        print(birthday)
        if (birthday == 1) {
            if let path = Bundle.main.path(forResource: "videoplayback", ofType: "mp4") {
                let video = AVPlayer(url: URL(fileURLWithPath: path))
                let videoPlayer = AVPlayerViewController()
                videoPlayer.player = video
                
                present(videoPlayer, animated: true, completion: {
                    video.play()
                    
                })
                
            }
        }
    }
    func endEvent(currentdate: Date, eventdate: Date) {
        if currentdate >= eventdate {
                timerLabel.text = "Happy Birthday! Press here :)"
                // Stop Timer
                timer.invalidate()
                birthday = 1
                
//                let confettiView = SAConfettiView(frame: self.view.bounds)
//                confettiView.type = .Diamond
//                
//                view.addSubview(confettiView)
//                view.bringSubviewToFront(timeButton)
//                confettiView.startConfetti()
            }
        }
    }
