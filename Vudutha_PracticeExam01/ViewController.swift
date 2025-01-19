//
//  ViewController.swift
//  Vudutha_PracticeExam01
//
//  Created by Mahitha Vudutha on 1/19/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FeetOutlet: UITextField!
    
    
    @IBOutlet weak var InchesOutlet: UITextField!
    
    
    @IBOutlet weak var WeightOutlet: UITextField!
    
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    
    @IBOutlet weak var Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Calculate(_ sender: UIButton) {
        guard let hfeet = FeetOutlet.text, let feet = Int(hfeet),
              let hinches = InchesOutlet.text, let inches = Int(hinches),
              let hweight = WeightOutlet.text, let weight = Double(hweight)
        else {
            return
        }
        let height = feet * 12 + inches
        let bmi = 703 * (weight / Double(height * height))
        let roundedBmi = round(10 * bmi) / 10
        
        var category = ""
        var imageName = ""
        var healthTip = ""
        
        if roundedBmi <= 18.5 {
            category = "Underweight🪫"
            imageName = "underWeight"
            healthTip = "Eat more protein and healthy fats."
        } else if roundedBmi <= 24.9 {
            category = "Normal👍"
            imageName = "normal"
            healthTip = "Excellent! Maintain a balanced lifestyle."
        }else if roundedBmi <= 29.9 {
            category = "Overweight"
            imageName = "overWeight"
            healthTip = "Lose weight by maintaining a balanced diet less and increasing physical activity."
        }else {
            category = "Obese"
            imageName = "obese"
            healthTip = "Consult a doctor for personalized advice."
        }
        ResultLabel.text = """
Your Body Mass Index is \(roundedBmi). 
This is considered \(category).
Healthtip: \(healthTip)
"""
        Image.image = UIImage(named: imageName)
    }
    
}

