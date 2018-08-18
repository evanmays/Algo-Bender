//
//  Stack.swift
//  Algo Bender
//
//  Created by Evan Mays on 8/17/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import Foundation

struct Stack {
    fileprivate var array: [ ([Int], [[Int]]) ] = [ ([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], []) ]
    mutating func push(_ element: ([Int], [[Int]])) {
        array.append(element)
    }
    
    mutating func pop() -> ([Int], [[Int]])? {
        return array.popLast()
    }
    
    func peek() -> ([Int], [[Int]])? {
        return array.last
    }
    
    func size() -> Int {
        return array.count
    }
}
