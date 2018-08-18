//
//  PracticeArrays.swift
//  Algo Bender
//
//  Created by Evan Mays on 8/17/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import Foundation

struct PracticeArrays {
    fileprivate var tempArrays: [[Int]] = []
    fileprivate var items: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    fileprivate var history: Stack = Stack()
    
    mutating func undo() {
        history.pop()
        let temp = history.pop()
        items = (temp?.0)!
        tempArrays = (temp?.1)!
    }
    
    mutating func saveChange() {
        history.push((items, tempArrays))
    }
    
    func numOfTemps() -> Int {
        return tempArrays.count
    }
    
    func getAllTempArrs() -> [[Int]] {
        return tempArrays
    }
    func getArray(pos: Int) -> [Int]{
        if (pos == -1) {
            return items
        }
        else {
            return tempArrays[pos]
        }
    }
    func getItemInArr(arrNum: Int, item: Int) -> Int {
        //arrNum -1 is main array
        //anything else is temp array
        if (arrNum == -1) {
            return items[item]
        }
        else {
            return tempArrays[arrNum][item]
        }
    }
    
    mutating func setItemInArr(arrNum: Int, item: Int, val: Int) {
        if (arrNum == -1) {
            items[item] = val
        }
        else {
            tempArrays[arrNum][item] = val
        }
    }
    
    mutating func shuffleNums() {
        //items.shuffle()
        for i in (0 ..< items.count).reversed() {
            let random = Int(arc4random_uniform(UInt32(i)))
            let temp = items[i]
            items[i] = items[random]
            items[random] = temp
        }
        //remove all from history, and start with history.push((items, tempArrays))
    }
    
    mutating func flipNums(arrNum: Int, n: Int) {
        var temp: [Int] = []
        for i in 0...n {
            temp.insert(getItemInArr(arrNum: arrNum, item: i), at: 0)
        }
        for i in 0...n {
            setItemInArr(arrNum: arrNum, item: i, val: temp[i])
        }
    }
    
    mutating func plusplusNumber(arrNum: Int, i: Int) {
        var item = getItemInArr(arrNum: arrNum, item: i)
        item += 1
        setItemInArr(arrNum: arrNum, item: i, val: item)
    }
    
    mutating func minusminusNumber(arrNum: Int, i: Int) {
        var item = getItemInArr(arrNum: arrNum, item: i)
        item -= 1
        setItemInArr(arrNum: arrNum, item: i, val: item)
    }
    
    mutating func newNums() {
        //TODO: Uncomment
        //savedPositions = [Int.random(in: 1 ... 10)]
        items = [Int(arc4random_uniform(10) + 1)] //TODO: Remove
        for i in 1...20 {
            let prev = items[i-1]
            //TODO: Uncomment
            //let next = prev + Int.random(in: 1 ... 10)
            let next = prev + Int(arc4random_uniform(10) + 1) //TODO: Remove
            items.append(next)
        }
        //remove all from history, and start with history.push((items, tempArrays))
    }
    
    mutating func swapNums(firstArrNum: Int, firstItem: Int, secondArrNum: Int, secondItem: Int) {
        let firstVal = getItemInArr(arrNum: firstArrNum, item: firstItem)
        let secondVal = getItemInArr(arrNum: secondArrNum, item: secondItem)
        
        setItemInArr(arrNum: firstArrNum, item: firstItem, val: secondVal)
        setItemInArr(arrNum: secondArrNum, item: secondItem, val: firstVal)
    }
    
    mutating func copyNums(firstArrNum: Int, firstItem: Int, secondArrNum: Int, secondItem: Int) {
        let firstVal = getItemInArr(arrNum: firstArrNum, item: firstItem)
        setItemInArr(arrNum: secondArrNum, item: secondItem, val: firstVal)
    }
    
    mutating func updateTempCount(_ num: Int) {
        if (num > tempArrays.count) {
            //we are adding temp arrays
            //num > tempArrays.count >= 0 so num > 0 too!
            for i in 0 ..< num {
                if (!tempArrays.indices.contains(i)) {
                    //ith index does not exist
                    //initialize it as same size as items
                    tempArrays.append(Array.init(repeating: 0, count: items.count))
                }
            }
        }
        else if (num < tempArrays.count) {
            tempArrays.removeLast(tempArrays.count - num)
        }
    }
    
    func weShouldEnableUndo() -> Bool{
        return history.size() > 1
    }
}
