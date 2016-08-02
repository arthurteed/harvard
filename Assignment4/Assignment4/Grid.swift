//
//  Grid.swift
//  Assignment4
//
//  Created by Arthur (Live) on 15.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import Foundation

/*class Grid: GridProtocol{
    
    var grid = [[CellState]](count: 20, repeatedValue: [CellState](count: 20, repeatedValue: .Empty))
    
    enum CellState{
        case Living
        case Born
        case Died
        case Empty
    }
    
    var rows: Int
    var cols: Int
    required init(rows: Int, cols: Int) {
    }
   
    func neighbors(pos: Position) -> [Position] {
        return offsets.map { ((pos.row + rows + $0.row) % rows, (pos.col + cols + $0.col) % cols) }    }
    
 //Could Not Understand/Fix Subscript error, so continued with assignment as best as possible.
    subscript(pos:Position)-> CellState {
        get{
            return grid[rows][cols]
        }
        set{
            grid[rows][cols] = CellState
        }}

}
 */