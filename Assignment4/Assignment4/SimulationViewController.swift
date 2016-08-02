//
//  SimulationViewController.swift
//  Assignment4
//
//  Created by Arthur (Live) on 15.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

//SELF MADE APP ICON
//TAB ICON FROM: ICONS8.COM

class SimulationViewController:UIViewController, EngineDelegateProtocol{
    
    func engineDidUpdate(withGrid: GridProtocol) {
        NSNotificationCenter.defaultCenter().postNotificationName("Grid", object: nil, userInfo: nil)
    }
    
    @IBAction func invokeStep(sender: AnyObject) {
        
        step([Cell])
        
    }
    override func viewDidLoad() {
        viewDidLoad()
        
        SharedEngine.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
    }


}

