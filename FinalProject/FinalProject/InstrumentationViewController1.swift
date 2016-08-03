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
        StandardEngine.sharedInstance.refreshRate = Double(interval.value)
        tab.delegate = self
        
    }
    
    var rate = StandardEngine.sharedInstance.refreshRate
    @IBOutlet weak var toggleStatus: UILabel!
    @IBOutlet weak var colStepperOutlet: UIStepper!
    @IBOutlet weak var rowStepperOutlet: UIStepper!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var interval: UISlider!
    @IBOutlet weak var rows: UITextField!
    @IBOutlet weak var cols: UITextField!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    //WHEN YOU CHANGE THE SLIDER AND THE TIMER, THIS FUNCTION IS CALLED
    @IBAction func timedRefreshToggle(sender: AnyObject) {
        var switchOn: [String:AnyObject] = [ "switchOn": "false"]
        if toggleSwitch.on {
            switchOn = [ "switchOn": "true"]
            StandardEngine.sharedInstance.refreshRate = Double(interval.value)
        } else {
            StandardEngine.sharedInstance.refreshRate = 0
        }
        rate = StandardEngine.sharedInstance.refreshRate
        StandardEngine.sharedInstance.startTimerWithInterval(NSTimeInterval(rate))
        NSNotificationCenter.defaultCenter().postNotificationName("timerToggled",
                                                                  object: nil,
                                                                  userInfo: switchOn)
        
    }
    
    @IBAction func refreshRateSlider(sender: UISlider) {
        let change = String(format:"%.2f", sender.value)
        sliderValue.text = String(stringInterpolationSegment: change)
        StandardEngine.sharedInstance.refreshRate = Double(interval.value)
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

