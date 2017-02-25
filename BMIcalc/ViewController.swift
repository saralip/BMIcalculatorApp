//
//  ViewController.swift
//  BMIcalc
//
//  Created by Sara Lipowsky on 2/24/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var heightInputText: UITextField!
    
    @IBOutlet weak var weightInputText: UITextField!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Actions
    
    @IBOutlet weak var metricSwitchOutlet: UISwitch!
    
    @IBAction func metricSwitchOutlet(_ sender: UISwitch) {
        if (self.metricSwitchOutlet.isOn){
            self.heightInputText.placeholder = "cm"
            self.weightInputText.placeholder = "kg"
        }
        else{
            
            self.heightInputText.placeholder = "in"
            self.weightInputText.placeholder = "lb"
        }

        
    }
    
    @IBAction func calculatorBtn(_ sender: UIButton) {
        
        let textW: String = weightInputText.text!
        var weightFloat = Float(weightInputText.text!)!
        
        let textH: String = weightInputText.text!
        var heightFloat = Float(heightInputText.text!)!
        //var bmiVal: Int = 0
        //if in metric mode
        let bmi: Float
        if (self.metricSwitchOutlet.isOn)
        {
            //cm to meter
            heightFloat = (heightFloat/100.0)
            //kg
            
            bmi = calcBMI(h: heightFloat, w: weightFloat)
        }
            //metric mode is off (imperical)
        else
        {
            //inches to meters
            heightFloat = (heightFloat * 0.0254)
            weightFloat = (weightFloat * 0.453592)
            
            bmi = calcBMI(h: heightFloat, w: weightFloat)
        }
        
        
        print(heightFloat)
        print ("BMI: ")
        print(bmi)
        
        var range : String
        
        if bmi < 16.0{
            range = "Severe Thinness"
        }
        else if bmi >= 16.0 && bmi <= 16.99{
            range = "Moderate Thinness"
        }
        else if bmi >= 17.0 && bmi <= 18.49{
            range = "Mild Thinness"
        }
        else if bmi >= 18.5 && bmi <= 24.99{
            range = "Normal Range"
        }
        else if bmi >= 25.0 && bmi <= 29.99{
            range = "Overweight"
        }
        else if bmi >= 30.0 && bmi <= 34.99{
            range = "Obese Class I (Moderate)"
        }
        else if bmi >= 35.0 && bmi <= 39.99{
            range = "Obese Class II (Moderate)"
        }
        else if bmi > 39.99{
            range = "Obese Class III (Severe)"
        }
        else{
            range = "Out of range"
        }
        
        print(range)

    }
    
    func calcBMI(h: Float, w: Float) ->Float {
        let bmiVal:Float = w/(h * h)
        
        print(bmiVal)
        return bmiVal
    }

    
    

}

