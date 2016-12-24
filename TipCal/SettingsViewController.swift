//
//  SettingsViewController.swift
//  TipCal
//
//  Created by oscar rodriguez on 12/14/16.
//  Copyright © 2016 oscar rodriguez. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
   
    var arrayValues = [Double]()
    let defaults = UserDefaults.standard
    var showSplitView = false
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var firstSlider: UISlider!
    
    @IBOutlet weak var secondSlider: UISlider!
    @IBOutlet weak var thirdSlider: UISlider!
    
    @IBOutlet weak var tipLabelOne: UILabel!
    
    @IBOutlet weak var tipLabelTwo: UILabel!
    @IBOutlet weak var tipLabelThree: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        arrayValues = defaults.object(forKey: "percentValues") as? [Double] ?? [Double]()
        
        if (arrayValues.isEmpty){
            arrayValues = [0.18,0.20,0.25]
        }
        

        
        let tipZeroString = String(Int(arrayValues[0] * 100)) + "%"
        tipLabelOne.text = tipZeroString
        segmentControl.setTitle(tipZeroString, forSegmentAt:0)
        firstSlider.setValue(Float(arrayValues[0] * 100), animated: true)
        
        let tipOneString = String(Int(arrayValues[1] * 100)) + "%"
        tipLabelTwo.text = tipOneString
        segmentControl.setTitle(tipOneString, forSegmentAt:1)
        secondSlider.setValue(Float(arrayValues[1] * 100), animated: true)
        
        let tipTwoString = String(Int(arrayValues[2] * 100)) + "%"
        tipLabelThree.text = tipTwoString
        segmentControl.setTitle(tipTwoString, forSegmentAt:2)
        thirdSlider.setValue(Float(arrayValues[2] * 100), animated: true)
        
       
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func onSLiderChangedOne(_ sender: Any) {
        
        let tipOne = String(Int(self.firstSlider.value)) + "%"
        tipLabelOne.text = tipOne
        segmentControl?.setTitle(tipOne, forSegmentAt:0)
        let sliderValue = Double(Int(self.firstSlider.value))/100
        saveDefaults(value: sliderValue, index: 0)
        
    }
    
    
    
    @IBAction func onSliderChangedTwo(_ sender: Any) {
        
        let tipTwo = String(Int(self.secondSlider.value))+"%"
        tipLabelTwo.text = tipTwo
        segmentControl?.setTitle(tipTwo, forSegmentAt:1)
        let sliderValue = Double(Int(self.secondSlider.value))/100
        saveDefaults(value: sliderValue, index: 1)
        
    }
    
    
    @IBAction func onSliderChangedThree(_ sender: Any) {
        
        let tipThree = String(Int(self.thirdSlider.value)) + "%"
        tipLabelThree.text = tipThree
        segmentControl?.setTitle(tipThree, forSegmentAt:2)
        let sliderValue = Double(Int(self.thirdSlider.value))/100
        saveDefaults(value:sliderValue,index:2)
    }
    
    
    
    func saveDefaults(value:Double,index:Int){
        
        arrayValues[index] = value
        defaults.set(arrayValues, forKey:"percentValues")
        defaults.synchronize()
        
    }
    
    
    
    
    
}
