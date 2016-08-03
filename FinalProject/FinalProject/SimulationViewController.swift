//
//  SimulationViewController.swift
//  FinalProject
//
//  Created by Arthur (Live) on 01.08.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {
    
    let engine = StandardEngine.sharedInstance
    
    //WHEN YOU PRESS SAVE BUTTON (NOT YET FUNCTIONING)
    @IBAction func saveSimulationGrid(sender: AnyObject) {
        print("save")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(refreshGridWithTimer), name: "timerToggled", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        engine.preconfig = nil
        engine.delegate = self
        gridView.setNeedsDisplay()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        gridView.setNeedsDisplay()
        StandardEngine.sharedInstance.startTimerWithInterval(10)
    }
    
    func refreshGridWithTimer(notification: NSNotification) {
        if let mySwitchBool = notification.userInfo as? [String:AnyObject] {
            print(mySwitchBool)
            
            engine.grid = StandardEngine.sharedInstance.step()
            gridView.setNeedsDisplay()
        }
    }
    
    func engineDidUpdate(withpreconfigs: Array<GridData>) {
        
    }
    
    //WHEN YOU PRESS START BUTTON
    @IBAction func start(sender: AnyObject) {
        
        engine.grid = StandardEngine.sharedInstance.step()
        gridView.setNeedsDisplay()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SimulationViewController.NextTimerNoticationFunction(_:)), name:"NextTimerNotification", object: nil)
        
    }

    func NextTimerNoticationFunction(notification: NSNotification){
        engine.grid = StandardEngine.sharedInstance.step()
        gridView.setNeedsDisplay()
        
    }
    //WHEN YOU PRESS RESET BUTTON
    @IBAction func refreshGrid(sender: AnyObject) {
        gridView.engine.grid = Grid(engine.rows, engine.cols) { _,_ in .Empty }
        gridView.setNeedsDisplay()
        
    }
    //REFERENCE TO GRID
    @IBOutlet weak var gridView: GridView!
}

