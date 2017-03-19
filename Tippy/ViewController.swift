//
//  ViewController.swift
//  Tippy
//
//  Created by Rui Mao on 3/1/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var numPeople: UILabel!
    @IBOutlet weak var eachPerson: UILabel!
    @IBOutlet weak var tipStepperUI: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        
                // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tipStepper(_ sender: UIStepper) {
        print("SENDER VALUE: " + String(sender.value))
        tipPercentage.text = Int(sender.value).description
        calculateTip(self)

        
    }
  
    @IBAction func peopleStepper(_ sender: UIStepper) {
        numPeople.text = Int(sender.value).description
        calculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        //let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        //let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let tip = bill * Double(tipPercentage.text!)! * 0.01
        let defaults = UserDefaults.standard
        defaults.synchronize()
        
        var roundStatus = false
        if (defaults.object(forKey: "roundStatus") != nil) {
            roundStatus = defaults.bool(forKey: "roundStatus")
        }
        var total = Double(0)
        if (roundStatus){
            total = ceil(bill + tip)
        }
        else{
            total = bill + tip
        }

        print("NUM PEOPLE: " + numPeople.text!)
        let perPerson = total / Double(numPeople.text!)!
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        eachPerson.text = String(format: "$%.2f", perPerson)
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        defaults.synchronize()
        if (defaults.object(forKey: "tipValue") != nil) {
            tipPercentage.text = String(defaults.integer(forKey: "tipValue"))
            tipStepperUI.value = Double(defaults.integer(forKey: "tipValue"));
        }
        
        calculateTip(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
}

