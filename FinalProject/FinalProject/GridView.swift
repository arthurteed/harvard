//
//  GridView.swift
//  Assignment3
//
//  Created by Arthur (Live) on 07.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
        
        let engine = StandardEngine.sharedInstance
        var rows: Int {
            get {
                if let preconfig = engine.preconfig {
                    let intarray: Array<Int> = preconfig.contents.map({
                        return $0.row
                    })
                    return intarray.maxElement()! + 1
                }
                return engine.rows
            }
            set {
                engine.rows = newValue
            }
        }
        var cols: Int {
            get {
                if let preconfig = engine.preconfig {
                    let intarray: Array<Int> = preconfig.contents.map({
                        return $0.col
                    })
                    return intarray.maxElement()! + 1
                }
                
                return engine.cols
            }
            set {
                engine.cols = newValue
            }
        }
        
        var grid: GridProtocol {
            get {
                if let preconfig = engine.preconfig {
                    return Grid(rows,cols) { position in
                        if preconfig.contents.contains({
                            return $0.row == position.row && $0.col == position.col
                        }) {
                            return .Alive
                        } else {
                            return .Empty
                        }
                    }
                    
                }
                
                return engine.grid
            }
            set {
                if let _ = engine.preconfig {
                    var array: Array<Position> = []
                    for row in 0..<rows {
                        for col in 0..<cols {
                            if grid[row,col] == .Alive {
                                array.append(Position(row,col))
                            }
                        }
                    }
                }
                engine.grid = newValue
            }
        }
    
     //ADDED POINTS PROPERTY
    
    var points: [Position] {
        get {
            return grid.cells.reduce([]) { (array, cell) -> [Position] in
                if cell.state == .Alive {
                    return array + [cell.position]
                }
                return array
            }
        }
        set {
            let newGrid = Grid(rows, cols) { position in
                return newValue.contains({ return position.row == $0.row && position.col == $0.col }) ? .Alive : .Empty
            }
            grid = newGrid
            if let delegate = StandardEngine.sharedInstance.delegate {
                delegate.engineDidUpdate(grid)
            }
        }
    }

    //DRAWING THE GRID

    @IBInspectable var livingColor:   UIColor = UIColor.whiteColor()
    @IBInspectable var emptyColor:    UIColor = UIColor.whiteColor()
    @IBInspectable var bornColor:     UIColor = UIColor.whiteColor()
    @IBInspectable var diedColor:     UIColor = UIColor.whiteColor()
    @IBInspectable var gridColor:     UIColor = UIColor.blackColor()
    @IBInspectable var gridWidth:     CGFloat = 1.0
    @IBInspectable var fillColor = UIColor.clearColor()
    @IBInspectable var xProportion = CGFloat(0.8)
    @IBInspectable var widthProportion = CGFloat(0.002)
    
    var addCol: CGFloat = 0.0
    var addRow: CGFloat = 0.0
    var rowStart: CGFloat = 0.0
    var rowEnd: CGFloat = 0.0
    var colStart: CGFloat = 0.0
    var colEnd: CGFloat = 0.0
    var colWidth: CGFloat = 0.0
    var rowWidth: CGFloat = 0.0
    
    func state(value:CellState) -> UIColor {
        switch value {
        case .Empty: return emptyColor
        case .Died: return diedColor
        case .Born: return bornColor
        case .Alive: return livingColor
        }
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
            
            let path = UIBezierPath(rect: rect)
            fillColor.setFill()
            path.fill()
            
            let lineWidth: CGFloat = sqrt(bounds.width*bounds.height) * widthProportion
            addCol = bounds.height * xProportion
            addRow = bounds.width * xProportion
            let plusPath = UIBezierPath()
            
            plusPath.lineWidth = lineWidth
            
            let x0: CGFloat = (bounds.width - addRow)/2
            let y0: CGFloat = (bounds.height - addCol)/2
            rowStart = 0 + x0
            rowEnd = bounds.width - x0
            colStart = 0 + y0
            colEnd = bounds.height - y0
            
            
            colWidth = addRow/CGFloat(cols)
            rowWidth = addCol/CGFloat(rows)
            
            var x1: CGFloat  = 0
            var x2: CGFloat  = 0
            var y1: CGFloat  = 0
            var y2: CGFloat  = 0
            for i in 0...cols {
                x1 = colWidth * CGFloat(i) + rowStart
                y1 = colStart
                x2 = x1
                y2 = colEnd
                
                plusPath.moveToPoint(CGPoint(
                    x:x1,
                    y:y1))
                
                plusPath.addLineToPoint(CGPoint(
                    x:x2,
                    y:y2))
            }
            
            var x11: CGFloat  = 0
            var x22: CGFloat  = 0
            var y11: CGFloat  = 0
            var y22: CGFloat  = 0
            for i in 0...rows {
                x11 = rowStart
                y11 = rowWidth * CGFloat(i) + colStart
                x22 = rowEnd
                y22 = y11
                
                plusPath.moveToPoint(CGPoint(
                    x:x11,
                    y:y11))
                
                plusPath.addLineToPoint(CGPoint(
                    x:x22,
                    y:y22))
            }
            
            gridColor.setStroke()
            
            plusPath.stroke()
            
            var x: CGFloat  = 0
            var y: CGFloat  = 0
            for i in 0...rows-1 {
                y = (CGFloat(i) * rowWidth) + colStart
                for j in 0...cols-1 {
                    x = (CGFloat(j) * colWidth) + rowStart
                    let ovalPath = UIBezierPath(ovalInRect: CGRectMake(x, y, colWidth, rowWidth))
                    state(grid[i,j]).setFill()
                    ovalPath.fill()
                }
            }
        
        }

        func statistics() -> Array<Int> {
            var living = 0
            var empty = 0
            var born = 0
            var died = 0
            for i in 0...rows-1 {
                for j in 0...cols-1 {
                    
                    if grid[i,j] == .Alive  {
                        living = living + 1
                    }
                    if grid[i,j] == .Empty  {
                        empty = empty + 1
                    }
                    if grid[i,j] == .Born  {
                        born = born + 1
                    }
                    if grid[i,j] == .Died  {
                        died = died + 1
                    }
                }
            }
            return [living, empty, born, died]
        }
    
    
//LAST BRACKET
    
}


