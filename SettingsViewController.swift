//
//  SettingsViewController.swift
//  tippy
//
//  Created by Baid, Puja on 3/2/17.
//  Copyright © 2017 Baid, Puja. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var DefaultTipPercentage: UITextField!
    @IBOutlet weak var saveTipPercentBtn: UIButton!
    @IBOutlet weak var cancelTipPercentBtn: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveTipPercentSetting(_ sender: Any) {
        let defaults = UserDefaults.standard
        let perc = Double(DefaultTipPercentage.text!) ?? 0
        defaults.set(round(perc) , forKey: "tipPercent")
        defaults.synchronize()
        

    }
    
}
