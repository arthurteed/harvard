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
    var switchOn: [String:AnyObject] = [ "switchOn": "false"]

    
    //WHEN YOU PRESS SAVE BUTTON A NOTIFICATION WILL POP UP W/ NEW, SAVE, AND CANCEL
    @IBAction func saveSimulationGrid(sender: AnyObject) {
        let alert = UIAlertController(title: "New Name",
                                      message: "Add a new name",
                                      preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        self.engine.preconfigs.append(GridData(title: textField!.text!, contents: self.gridView.points ))
                                        
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
                              animated: true,
                              completion: nil)
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
        StandardEngine.sharedInstance.startTimerWithInterval(StandardEngine.sharedInstance.refreshRate * 20)
    }
    
    func refreshGridWithTimer(notification: NSNotification)  {
        switchOn = (notification.userInfo as? [String:AnyObject])!
        if (switchOn["switchOn"]! as! String == "true") {
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
        
        if (switchOn["switchOn"]! as! String == "true") {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(NextTimerNoticationFunction(_:)), name:"NextTimerNotification", object: nil)
        }
        else {
            StandardEngine.sharedInstance.startTimerWithInterval(0)
            StandardEngine.sharedInstance.refreshRate = 0
        }
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

