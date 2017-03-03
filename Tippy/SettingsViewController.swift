//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Rui Mao on 3/2/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chageTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipSegment.selectedSegmentIndex, forKey: "tipIndex")
        defaults.synchronize()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        defaults.synchronize()
        if (defaults.object(forKey: "tipIndex") != nil) {
            tipSegment.selectedSegmentIndex = defaults.integer(forKey: "tipIndex")
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
