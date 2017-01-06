//
//  ViewController.swift
//  TipCal
//
//  Created by oscar rodriguez on 12/8/16.
//  Copyright © 2016 oscar rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    var tipPorcentages = [Double]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        billField.becomeFirstResponder()
        tipPorcentages = defaults.object(forKey: "percentValues") as? [Double] ?? [Double]()
        
        if(tipPorcentages.isEmpty){
            tipPorcentages = [0.18, 0.20, 0.25]
        }
         
        let tipZero = String(Int(tipPorcentages[0] * 100)) + "%"
        tipControl.setTitle(tipZero, forSegmentAt: 0)

        let tipOne = String(Int(tipPorcentages[1] * 100)) + "%"
        tipControl.setTitle(tipOne, forSegmentAt: 1)

        let tipTwo = String(Int(tipPorcentages[2] * 100)) + "%"
        
        tipControl.setTitle(tipTwo, forSegmentAt: 2)
        calculateTip(self)
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: Any) {
     
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPorcentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
            }
    
  }

