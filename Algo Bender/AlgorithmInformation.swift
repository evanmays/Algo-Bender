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
    
    static var insertionSort = Algorithm.init(id: 0, name: "Insertion sort", type: "", readability: "", worstTime: "O(n^2)", avgTime: "O(n^2)", bestTime: "O(n)", worstSpace: "O(1)", avgSpace: "O(1)", bestSpace: "O(1)", wikipediaURL: "https://en.wikipedia.org/wiki/Insertion_sort", codeAlgoRythmics: "ROalU379l3U", codeHackerRank: "", codeGeeksForGeeks: "OGzPmgsI-pQ")//done
    
    static var selectionSort = Algorithm.init(id: 1, name: "Selection sort", type: "", readability: "", worstTime: "O(n^2)", avgTime: "O(n^2)", bestTime: "O(n^2)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var bubbleSort = Algorithm.init(id: 2, name: "Bubble sort", type: "", readability: "", worstTime: "O(n^2)", avgTime: "O(n^2)", bestTime: "O(n)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var pancakeSort = Algorithm.init(id: 3, name: "Pancake sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var heapSort = Algorithm.init(id: 4, name: "Heap sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var blockSort = Algorithm.init(id: 4, name: "Block sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var timSort = Algorithm.init(id: 4, name: "Timsort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    //static var quickSort = Algorithm.init(id: 0, name: "Quicksort", type: "", readability: "", worstTime: "O(n^2)", avgTime: "O(n log n)", bestTime: "O(n log n)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    //static var mergeSort = Algorithm.init(id: 1, name: "Merge sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "O(n log n)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    //static var bucketSort = Algorithm.init(id: 2, name: "Bucket sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    //static var countingSort = Algorithm.init(id: 8, name: "Counting sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    //static var radixSort = Algorithm.init(id: 8, name: "Counting sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var algosArray = [insertionSort, selectionSort, bubbleSort, pancakeSort, heapSort, blockSort, timSort]
}

struct Algorithm {
    var id: Int
    var name: String
    
    var type: String
    var readability: String
    
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
    
    init(id: Int, name: String, type: String, readability: String, worstTime: String, avgTime: String, bestTime: String, worstSpace: String, avgSpace: String, bestSpace: String, wikipediaURL: String, codeAlgoRythmics: String, codeHackerRank: String, codeGeeksForGeeks: String) {
        self.id = id
        self.name = name
        
        self.type = type
        self.readability = readability
        
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
