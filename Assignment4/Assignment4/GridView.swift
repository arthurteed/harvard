//
//  GridView.swift
//  Assignment3
//
//  Created by Arthur (Live) on 07.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    @IBInspectable var rows: Int   = 20
    @IBInspectable var cols: Int   = 20
    
    @IBInspectable var livingColor:   UIColor = UIColor.blueColor()
    @IBInspectable var emptyColor:    UIColor = UIColor.grayColor()
    @IBInspectable var bornColor:     UIColor = UIColor.yellowColor()
    @IBInspectable var diedColor:     UIColor = UIColor.purpleColor()
    @IBInspectable var gridColor:     UIColor = UIColor.blackColor()
    @IBInspectable var gridWidth:     CGFloat = 0.0
    var grid = [[CellState]](count: 20, repeatedValue: [CellState](count: 20, repeatedValue: .Empty))
    
    
    
    override func drawRect(rect: CGRect) {
    
            
        let viewWidth: CGFloat = self.bounds.width
        let viewHeight: CGFloat = self.bounds.height
        var m = 0
        
        for _ in 0...cols {
            
            let verticalStroke = UIBezierPath()
            verticalStroke.lineWidth = gridWidth
        
            verticalStroke.moveToPoint(CGPoint(
            x:m,
            y:0))
        
            verticalStroke.addLineToPoint(CGPoint(
            x:m,
            y: Int(viewHeight)))
        
            gridColor.setStroke()
        
            verticalStroke.stroke()
            m+=15
                    }
            m = 0
        
        for _ in 0...rows {
            
            
            let horizontalStroke = UIBezierPath()
            horizontalStroke.lineWidth = gridWidth
            
            horizontalStroke.moveToPoint(CGPoint(
                x:0,
                y:m))
            
            horizontalStroke.addLineToPoint(CGPoint(
                x:Int(viewWidth),
                y:m ))
            
            gridColor.setStroke()
            horizontalStroke.stroke()
            m+=15
        }
        
        var xPos:CGFloat = 7.5
        
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 7.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            xPos+=15
            if grid[0][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[0][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[0][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[0][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
            
            
        }
        xPos = 7.5
        
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 22.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            xPos+=15
            if grid[1][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[1][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[1][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[1][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 37.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[2][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[2][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[2][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[2][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 52.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[3][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[3][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[3][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[3][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 67.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[4][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[4][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[4][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[4][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        
        xPos = 7.5
        
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 82.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[5][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[5][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[5][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[5][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 97.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[6][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[6][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[6][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[6][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 112.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[7][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[7][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[7][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[7][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 127.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[8][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[8][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[8][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[8][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 142.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[9][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[9][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[9][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[9][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 157.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[10][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[10][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[10][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[10][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 172.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[11][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[11][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[11][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[11][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 187.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[12][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[12][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[12][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[12][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 202.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[13][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[13][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[13][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[13][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 217.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[14][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[14][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[14][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[14][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 232.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[15][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[15][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[15][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[15][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 247.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[16][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[16][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[16][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[16][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 262.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[17][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[17][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[17][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[17][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 277.5
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[18][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[18][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[18][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[18][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        xPos = 7.5
        for x in 0..<rows {
            var center = CGPoint()
            center.x = xPos
            center.y = 292.5
            
            let radius = (CGFloat(5))
            let path:UIBezierPath = UIBezierPath()
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
            emptyColor.setFill()
            path.fill()
            xPos+=15
            if grid[19][x] == CellState.Empty {
                emptyColor.setFill()
                path.fill()
            }
            if grid[19][x] == CellState.Born {
                bornColor.setFill()
                path.fill()
            }
            if grid[19][x] == CellState.Living {
                livingColor.setFill()
                path.fill()
            }
            if grid[19][x] == CellState.Died {
                diedColor.setFill()
                path.fill()
            }
        }
        

        }
    
}

