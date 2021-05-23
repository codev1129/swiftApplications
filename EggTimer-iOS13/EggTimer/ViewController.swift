//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBOutlet weak var eggHeading: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes=["Soft":3,"Medium":4,"Hard":7]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBAction func eggsButton(_ sender: UIButton) {
        
        progressBar.progress = 0.0
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        
        totalTime = eggTimes[hardness]!
         
         
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
       
        
    }
    
    @objc func updateCounter() {
        
        if secondsPassed < totalTime {
            
            let percProg = Float(secondsPassed)/Float(totalTime)
            print(percProg)
            progressBar.progress = percProg
            secondsPassed += 1
            
            
        }
        else
        {
            timer.invalidate()
            eggHeading.text = "DONE!!!"
            progressBar.progress = 1.0
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!

        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()

        } catch let error as NSError {
            print(error.description)
        }
    }

   

}
