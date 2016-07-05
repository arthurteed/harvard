//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Arthur (Live) on 04.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

class Problem2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 2"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var Run: UIButton!
    @IBOutlet weak var Text: UITextView!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        //STEP() FROM ENGINE IS CALLED IN THE PROBLEM3VIEWCONTROLLER.SWIFT FILE
        
        var before = [[Bool]](count: 4, repeatedValue: [Bool](count: 4, repeatedValue: false))
        var after = [[Bool]](count: 4, repeatedValue: [Bool](count: 4, repeatedValue: false))
        
        var rand: Int
        var myBool = false
        var living: Int = 0
        
        let rows = 4
        let columns = 4
        
        for col in 0..<columns{
            for row in 0..<rows{
                rand = Int(arc4random_uniform(3) == 1)
                if rand == 1 {
                    myBool = true
                    living += 1
                }
                else if rand == 0 {
                    myBool = false
                }
                before[col][row] = myBool
            }
        }
            print(before)
            
       
        print ("Living Cells in Before: \(living)")
        
        
        //loop checks for living neighbors
        for col in 0..<columns{
            for row in 0..<rows{
                
                var livingNeighbors = 0
                after[col][row] = before[col][row]
        
                if before[(col+3)%4][(row+3)%4] == true {
                    
                    livingNeighbors += 1
                    
                }
                    
                if before[(col+3)%4][row] == true{
                    
                    livingNeighbors += 1
                }
                
                if before[(col+3)%4][(row+3)%4] == true{
                    
                    livingNeighbors += 1
                }
            
                if before[(col+3)%4][row] == true{
                    
                    livingNeighbors += 1
                }

                
                if before[(col+1)%4][(row+1)%4] == true{
                    
                    livingNeighbors += 1
                }
                
                if before[(col+1)%4][row] == true{
                    
                    livingNeighbors += 1
                    
                }
                
                if before[(col+1)%4][(row+1)%4] == true{
                    
                    livingNeighbors += 1
                    
                }
                
                if before[col][(row+1)%4] == true{
                    
                    livingNeighbors += 1
                }
                
                if before[(col+9)%4][(row+1)%4] == true{
                    
                    livingNeighbors += 1
                }
                    
                else{
                    
                    livingNeighbors += 0
                    
                }
                print("My Neighbors are" , livingNeighbors)
                    if livingNeighbors > 3{
                        after[col][row] = false
                    }
                    if livingNeighbors == 2  {
                        after[col][row] = true
                    }
                    if livingNeighbors == 3 {
                        after[col][row] = true
                    }
                    if livingNeighbors < 2 {
                        after[col][row] = false
                    }

            }
        }
        
        print(after)
        var newLive: Int = 0
        
        for col in 0..<columns{
            for row in 0..<rows{
                if after[col][row] == true{
                    newLive += 1
                }
            }}

        print ("Living Cells in After: \(newLive)")
        Text.text = "Living Cells in Before: \(living)\n Living Cells in After:  \(newLive)"
      
        
        
            }
    
            }
            


