//
//  ViewController.swift
//  Assignment3
//
//  Created by Arthur (Live) on 07.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTap(tapGR: UITapGestureRecognizer) {
        
        let tapPoint = tapGR.locationInView(self.view)
        print(tapPoint)

    }


}

