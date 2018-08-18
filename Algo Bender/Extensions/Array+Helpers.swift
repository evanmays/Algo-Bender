//
//  Array+Helpers.swift
//  Algo Bender
//
//  Created by Evan Mays on 8/17/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func isSorted() -> Bool{
        var curr = self[0]
        for next in self {
            if next < curr {
                return false
            }
            curr = next
        }
        return true
    }
}
