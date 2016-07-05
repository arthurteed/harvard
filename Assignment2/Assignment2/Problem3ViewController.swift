//
//  Problem3ViewController.swift
//  Assignment2
//
//  Created by Arthur (Live) on 04.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

class Problem3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 3"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Run: UIButton!
    @IBOutlet weak var Text: UITextView!
    
    @IBAction func buttonClicked(sender: AnyObject) {
      //THIS IS WHERE STEP FROM ENGINE IS CALLED
        step([[]])
        Text.text = "See build output for array."
    }
}

