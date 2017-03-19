//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Rui Mao on 3/2/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {

    @IBOutlet weak var badFace: UILabel!
    @IBOutlet weak var sosoFace: UILabel!
    @IBOutlet weak var goodFace: UILabel!
    @IBOutlet weak var billRoundSwitch: UISwitch!
    
    @IBAction func roundTotal(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(billRoundSwitch.isOn, forKey: "roundStatus")
        defaults.synchronize()
    }
    
    @IBOutlet weak var tipSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func indexToValue(_ index: Int) -> Int {
        if (index == 0)
        {
            return 18;
        }
        else if (index == 1)
        {
            return 20;
        }
        else
        {
            return 25;
        }
    }
    
    func valueToIndex(_ value: Int) -> Int {
        if (value == 18)
        {
            return 0;
        }
        else if (value == 20)
        {
            return 1;
        }
        else
        {
            return 2;
        }
    }

    
    @IBAction func chageTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(indexToValue(tipSegment.selectedSegmentIndex), forKey: "tipValue")
        defaults.synchronize()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        defaults.synchronize()
        if (defaults.object(forKey: "tipValue") != nil) {
            tipSegment.selectedSegmentIndex = valueToIndex(defaults.integer(forKey: "tipValue"))
        }
        if (defaults.object(forKey: "roundStatus") != nil){
            billRoundSwitch.isOn = defaults.bool(forKey: "roundStatus")
            }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
