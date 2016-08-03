//
//  InstrumentationViewController.swift
//  FinalProject
//
//  Created by Arthur (Live) on 01.08.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController, EngineDelegate {
    
    var tab   : EngineProtocol!
    var timer : StandardEngine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StandardEngine.sharedInstance.rows = 10
        StandardEngine.sharedInstance.cols = 10
        tab = StandardEngine.sharedInstance
        tab.delegate = self
        
    }
    
    @IBOutlet weak var toggleStatus: UILabel!
    @IBOutlet weak var colStepperOutlet: UIStepper!
    @IBOutlet weak var rowStepperOutlet: UIStepper!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var interval: UISlider!
    @IBOutlet weak var rows: UITextField!
    @IBOutlet weak var cols: UITextField!
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBAction func timedRefreshToggle(sender: AnyObject) {
        
        if toggleSwitch.on {
            StandardEngine.sharedInstance.count += 1
            let _ = interval.value
            let mySwitchBool = toggleSwitch.on
            print(mySwitchBool)
            let switchTrue: [String:AnyObject] = [ "switchTrue": "true"]
            StandardEngine.sharedInstance.startTimerWithInterval(NSTimeInterval(0))
            NSNotificationCenter.defaultCenter().postNotificationName("timerToggled",
                                                                      object: nil,
                                                                      userInfo: switchTrue)
            
        }
        else {
            let newValue = 0
            print(newValue)
            StandardEngine.sharedInstance.startTimerWithInterval(NSTimeInterval(0))
        }
        
        
    }
    
    @IBAction func refreshRateSlider(sender: UISlider) {
        let interval = String(format:"%.2f", sender.value)
        sliderValue.text = "Refresh Rate: " + String(stringInterpolationSegment: interval)
    }
    
    @IBAction func incrementRows(sender: AnyObject) {
        tab?.rows = Int(rowStepperOutlet.value)
        rows.text = String(tab!.rows)
    }
    
    @IBAction func incrementCols(sender: AnyObject) {
        tab?.cols = Int(colStepperOutlet.value)
        cols.text = String(tab!.cols)
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        
    }
    func engineDidUpdate(withConfigurations: Array<GridData>) {
        
    }
    
    
}

