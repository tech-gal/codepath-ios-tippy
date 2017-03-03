//
//  ViewController.swift
//  tippy
//
//  Created by Baid, Puja on 3/2/17.
//  Copyright © 2017 Baid, Puja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var gratuityField: UITextField!
    @IBOutlet weak var taxField: UITextField!
    @IBOutlet weak var noOfPeopleField: UITextField!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
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
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    @IBAction func calclateTip(_ sender: AnyObject) {
                        

        let tipPercentString = tipPercentSegment.titleForSegment(at: tipPercentSegment.selectedSegmentIndex)?.replacingOccurrences(of: "%", with: "")
        let tipPerc = Double(tipPercentString!) ?? 0
        let gratuity = Double(gratuityField.text!) ?? 0
        let tax = Double(taxField.text!) ?? 0
        let bill = Double(billField.text!) ?? 0
        let tip = (bill - (gratuity + tax) ) * tipPerc/100
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f",tip )
        totalLabel.text = String(format: "$%.2f",total )
        
    }
    @IBOutlet weak var TipPercentSliderControl: UISlider!
    @IBOutlet weak var SplitSliderControl: UISlider!
    @IBOutlet weak var TipSliderControl: UISlider!
    
    @IBOutlet weak var totalSliderControl: UISlider!
    
    @IBOutlet weak var tipSliderLabel: UILabel!
    @IBOutlet weak var splitSliderLabel: UILabel!
    @IBOutlet weak var tipPercentSliderLabel: UILabel!
    
    @IBOutlet weak var totalSliderLabel: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!

    @IBAction func calculateWhenTipPercentSliderChanged(_ sender: AnyObject) {

        let bill = Double(billField.text!) ?? 0
        totalSliderControl.maximumValue = (Float)(2*bill);
        TipSliderControl.maximumValue = (Float)(bill);

        let tipPerc = round(TipPercentSliderControl.value)
        let tip = ((Float)(bill) * tipPerc)/100

        let total = (Float)(bill) + tip
        let totalPerPrsn = total/round(SplitSliderControl.value)
        
        splitSliderLabel.text = String(format: "%.f",round(SplitSliderControl.value) );
        
        tipPercentSliderLabel.text = String(format: "%.f",round(TipPercentSliderControl.value) )+"%";
        
        totalPerPerson.text = String(format: "$%.2f",totalPerPrsn);
        
        TipSliderControl.value = tip;
        tipSliderLabel.text = String(format: "$%.2f",TipSliderControl.value );
        
        totalSliderControl.value = total;
        totalSliderLabel.text = String(format: "$%.2f",totalSliderControl.value );
    }
    
    
    
}

