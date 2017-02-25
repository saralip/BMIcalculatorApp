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
    
    @IBOutlet weak var yourResults: UILabel!
    
    @IBOutlet weak var bmiValueLabel: UILabel!
    
    @IBOutlet weak var resultDisplayLabel: UILabel!
    
    
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
            //already in kg
            
            bmi = calcBMI(h: heightFloat, w: weightFloat)
        }
            //metric mode is off (imperical)
        else
        {
            //inches to meters
            heightFloat = (heightFloat * 0.0254)
            //kgs to lbs
            weightFloat = (weightFloat * 0.453592)
            
            bmi = calcBMI(h: heightFloat, w: weightFloat)
        }
        
        
        print(heightFloat)
        print ("BMI: ")
        print(bmi)
        
        var bmiString : String
        bmiString = String(format: "%.2f", bmi)
        
        var range : String
        
        if bmi > 0 && bmi < 16.0{
            range = "Severe Thinness"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "gradientRed")


        }
        else if bmi >= 16.0 && bmi <= 16.99{
            range = "Moderate Thinness"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "gradientYellow")


        }
        else if bmi >= 17.0 && bmi <= 18.49{
            range = "Mild Thinness"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "gradientBlue")


        }
        else if bmi >= 18.5 && bmi <= 24.99{
            range = "Normal Range"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "gradientGreen")


        }
        else if bmi >= 25.0 && bmi <= 29.99{
            range = "Overweight"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "gradientPurple")

        }
        else if bmi >= 30.0 && bmi <= 34.99{
            range = "Obese Class I (Moderate)"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "gradientCoral")

        }
        else if bmi >= 35.0 && bmi <= 39.99{
            range = "Obese Class II (Moderate)"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "gradientOrange")


        }
        else if bmi > 39.99 && bmi <= 205{
            range = "Obese Class III (Severe)"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "gradientRed")
        }
        else{
            range = "Out of range"
            results(t:range, b:bmiString)
            self.backgroundImage.image = #imageLiteral(resourceName: "graygradient")
            
        }
        
        print(range)

    }
    
    func calcBMI(h: Float, w: Float) ->Float {
        let bmiVal:Float = w/(h * h)
        
        print(bmiVal)
        return bmiVal
    }

    func results(t: String, b: String){
        
        self.yourResults.text = "Your Results:"
        self.resultDisplayLabel.textAlignment = .center
        self.bmiValueLabel.textAlignment = .center
        
        self.bmiValueLabel.text = b
        self.resultDisplayLabel.text = t
    }
    
    

}

