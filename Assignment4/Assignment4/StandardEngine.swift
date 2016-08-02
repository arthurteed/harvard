//
//  StandardEngine.swift
//  Assignment4
//
//  Created by Arthur (Live) on 15.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import Foundation

let SharedEngine = StandardEngine()

class StandardEngine{
    
    
    
        var rows: UInt = 10
        var cols: UInt = 10
        var timer:NSTimer?
    
        func timerDidFire(timer:NSTimer) {
            rows += 1
            let center = NSNotificationCenter.defaultCenter()
            let n = NSNotification(name: "Notification",
                                   object: nil,
                                   userInfo: nil)
            center.postNotification(n)
            print ("\("Fired")")
        }
        

        
        var refreshInterval: NSTimeInterval = 0 {
            didSet {
                if refreshInterval != 0 {
                    if let timer = timer { timer.invalidate() }
                    timer = NSTimer.scheduledTimerWithTimeInterval(refreshInterval,
                                                                   target: self,
                                                                   selector: nil,userInfo: nil ,
                                                                   repeats: true)
                }
                else if let timer = timer {
                    timer.invalidate()
                }
                
                
                var delegate: EngineProtocol?
                func step() -> [[Bool]] {
                    return [[false]]
                }
                
            }
        }
    func step(grid:[Cell]) -> [Cell] {
        return grid.map {
            switch countLivingNeighbors(grid, cell: $0) {
            case 3, 2 where $0.alive : return (($0.position.row,$0.position.col), true)
            default: return (($0.position.row,$0.position.col), false)
            }
        }


    }

}
