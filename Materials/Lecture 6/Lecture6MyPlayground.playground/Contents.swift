//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//
//  ExampleProtocol.swift
//  Lecture 6
//
//  Created by Arthur (Live) on 11.07.16.
//  Copyright © 2016 Harvard. All rights reserved.
//

import Foundation

protocol ExampleProtocol {
    
    var rows: UInt{ get set }
    var cols: UInt{ get set }
    func step() -> [[Bool]]
    
}

protocol ExampleDelegateProtocol {
    func example(example: Example, didUpdateRows: UInt)
    
}

class Example : ExampleProtocol {
    var rows: UInt = 3 {
        didSet{
            if let delegate = delegate{
                delegate.example(self, didUpdateRows: rows)
            }
        }
    }
    
    
    //UInts cannot be negative
    
    var cols: UInt = 3
    var delegate: ExampleDelegateProtocol?
    func step() -> [[Bool]] {
        return [[false]]
        
    }
}

class ExampleDelegate: ExampleDelegateProtocol {
    func example(example: Example, didUpdateRows: UInt) {
        print("nothing")
    }
}