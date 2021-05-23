//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Vanshal Singh on 23/05/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    var bmiValue : String?

    @IBOutlet weak var bmiComments: UILabel!
    @IBOutlet weak var bmiResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiResult.text = bmiValue
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
