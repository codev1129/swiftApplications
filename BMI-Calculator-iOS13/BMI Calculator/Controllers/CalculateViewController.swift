//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    
    
    var bmiVal: String = ""
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightView: UILabel!
    @IBOutlet weak var weightView: UILabel!
    @IBAction func heightSlider(_ sender: UISlider) {
        
        heightView.text = String(format:"%.2f",sender.value)+"m"
        
        print(String(format:"%.2f",sender.value))
        
    }
    @IBAction func weightSlider(_ sender: UISlider) {
        
        weightView.text = String(format:"%.0f",sender.value)+"Kg"
        
        print(String(format:"%.0f",sender.value))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButton(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
       
        let bmi = weight/(height*height)
        bmiVal = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiVal
        }
    }
}

