//
//  AlgorithmInformation.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/29/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import Foundation

struct Algorithms {
    //when adding a new algorithm, don't forget to add it to algosArray
    static var quickSort = Algorithm.init(id: 0, name: "Quicksort", worstTime: "O(n^2)", avgTime: "O(n log n)", bestTime: "O(n log n)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var mergeSort = Algorithm.init(id: 1, name: "Merge sort", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "O(n log n)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var bucketSort = Algorithm.init(id: 2, name: "Bucket sort", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var insertionSort = Algorithm.init(id: 3, name: "Insertion sort", worstTime: "O(n^2)", avgTime: "O(n^2)", bestTime: "O(n)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var selectionSort = Algorithm.init(id: 4, name: "Selection sort", worstTime: "O(n^2)", avgTime: "O(n^2)", bestTime: "O(n^2)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var bubbleSort = Algorithm.init(id: 5, name: "Bubble sort", worstTime: "O(n^2)", avgTime: "O(n^2)", bestTime: "O(n)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var pancakeSort = Algorithm.init(id: 6, name: "Pancake sort", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var heapSort = Algorithm.init(id: 7, name: "Heap sort", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var countingSort = Algorithm.init(id: 8, name: "Counting sort", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var algosArray = [quickSort, mergeSort, bucketSort, insertionSort, selectionSort, bubbleSort, pancakeSort, heapSort, countingSort]
}

struct Algorithm {
    var id: Int
    var name: String
    var worstTime: String
    var avgTime: String
    var bestTime: String
    var worstSpace: String
    var avgSpace: String
    var bestSpace: String
    var wikipediaURL: String
    var codeAlgoRythmics: String
    var codeHackerRank: String
    var codeGeeksForGeeks: String
    
    init(id: Int, name: String, worstTime: String, avgTime: String, bestTime: String, worstSpace: String, avgSpace: String, bestSpace: String, wikipediaURL: String, codeAlgoRythmics: String, codeHackerRank: String, codeGeeksForGeeks: String) {
        self.id = id
        self.name = name
        self.worstTime = worstTime
        self.avgTime = avgTime
        self.bestTime = bestTime
        self.worstSpace = worstSpace
        self.avgSpace = avgSpace
        self.bestSpace = bestSpace
        self.wikipediaURL = wikipediaURL
        self.codeAlgoRythmics = codeAlgoRythmics
        self.codeHackerRank = codeHackerRank
        self.codeGeeksForGeeks = codeGeeksForGeeks
    }
}
