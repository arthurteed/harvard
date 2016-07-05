//
//  Problem4ViewController.swift
//  Assignment2
//
//  Created by Arthur (Live) on 04.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

class Problem4ViewController: UIViewController {
//THIS INCORPORATES ENGINEFORPROBLEM4.SWIFT
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 4"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var Run: UIButton!
    @IBOutlet weak var Text: UITextView!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        Text.text = "See the build output for neighbors() and step2()"
        step2([[]])
    }
}


