//
//  EngineProtocol.swift
//  Assignment4
//
//  Created by Arthur (Live) on 15.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import Foundation

protocol EngineProtocol{
    var delegate: EngineDelegateProtocol {get set}
    var grid: GridProtocol {get}
    var refreshRate: Double {get set}
    var refreshTimer: NSTimer {get set}
    var rows: Int {get set}
    var cols: Int {get set}
    init(rows: Int, cols: Int)
    func step() -> GridProtocol
    
}
