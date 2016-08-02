//
//  Engine

//
//  Created by Arthur (Live) on 05.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import Foundation

enum CellState : String {
    case Living = "Living"
    case Empty = "Empty"
    case Born = "Born"
    case Died = "Died"
    
    func description(rawValue: CellState) -> String {
        switch rawValue{
        case Living:
            return self.rawValue
        case Empty:
            return self.rawValue
        case Born:
            return self.rawValue
        case Died:
            return self.rawValue
        }
    }
    func allValues() -> [CellState] {
        return [CellState.Living , CellState.Empty, CellState.Born, CellState.Died]
    }
    
    func toggle(value:CellState) -> CellState {
        switch value{
        case .Empty:
            return .Living
        case .Died:
            return .Living
        case .Living:
            return .Empty
        case .Born:
            return .Empty
        }
    }
}

//typealias Position = (row:Int, col:Int)

let offsets:[Position] = [
    (-1,-1), (-1, 0), (-1, 1),
    ( 0,-1),          ( 0, 1),
    ( 1,-1), ( 1, 0), ( 1, 1)
]

var rows = 10
var cols = 10

func neighbors(pos:Position) -> [Position]  {
    return offsets.map { ((pos.row + rows + $0.row) % rows, (pos.col + cols + $0.col) % cols) }
}

typealias OldCellState = Bool
typealias Cell = (position:Position, alive:OldCellState)

var grid = (0..<rows*cols).map {
    (($0/cols, $0%cols), arc4random_uniform(3) == 1) as Cell
}

func countLiving(grid:[Cell]) -> Int {
    return grid.reduce(0) { return $1.alive ? $0 + 1 : $0 }
}

func countLivingNeighbors(grid:[Cell], cell: Cell) -> Int {
    return neighbors((cell.position.row, col:cell.position.col))
        .reduce(0) { grid[$1.row*cols + $1.col].alive ? $0 + 1 : $0 }
}

func step(grid:[Cell]) -> [Cell] {
    return grid.map {
        switch countLivingNeighbors(grid, cell: $0) {
        case 3, 2 where $0.alive : return (($0.position.row,$0.position.col), true)
        default: return (($0.position.row,$0.position.col), false)
        }
    }
}


