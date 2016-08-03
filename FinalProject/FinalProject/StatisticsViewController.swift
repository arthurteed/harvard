//
//  SimulationViewController.swift
//  FinalProject
//
//  Created by Arthur (Live) on 01.08.16.
//  Copyright © 2016 Harvard. All rights reserved.
//  CREDIT!!! IMAGE COMES FROM OPENCLIPART.ORG

import UIKit

class StatisticsViewController: UIViewController, EngineDelegate {
    
    let engine = StandardEngine.sharedInstance
    
    
    @IBOutlet weak var aliveCount: UITextField!
    @IBOutlet weak var deadCount: UITextField!
    @IBOutlet weak var bornCount: UITextField!
    @IBOutlet weak var emptyCount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        engine.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        let alivecount = engine.grid.alive
        let deadcount  = engine.grid.dead
        let borncount  = engine.grid.born
        let emptycount = engine.grid.empty
        
        aliveCount.text = "\(alivecount)"
        deadCount.text  = "\(deadcount)"
        bornCount.text  = "\(borncount)"
        emptyCount.text = "\(emptycount)"
    }
    
    func engineDidUpdate(withConfigurations: Array<GridData>) {
    }
}
