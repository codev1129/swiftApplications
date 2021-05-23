//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
       
    }
    
    var quizBrain = QuizBrain()
   

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
    
        let ansRecieved=sender.currentTitle!
        if  quizBrain.checkAnswer(ansRecieved)
        {
            sender.backgroundColor = UIColor.green
            
            
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.quesNo()
        
        Timer.scheduledTimer(timeInterval:0.2 , target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI()
    {
        questionLabel.text=quizBrain.getQuestionText()
        progressView.progress=quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor=UIColor.clear
        falseButton.backgroundColor=UIColor.clear
    }
    
}

