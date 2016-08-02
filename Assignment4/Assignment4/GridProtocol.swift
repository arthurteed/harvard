//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Arthur (Live) on 15.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import Foundation

typealias Position = (row:Int, col:Int)

protocol GridProtocol {
    
  
    init(rows: Int, cols: Int)
    var rows: Int {get}
    var cols: Int {get}
    
    func neighbors(pos:Position) -> [Position]
    
    subscript(pos:Position)-> CellState {get set}
    
}