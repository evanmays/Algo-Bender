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
    
    static var insertionSort = Algorithm.init(
        id: 0,
        name: "Insertion sort",
        type: "Insertion",
        readability: "",
        worstTime: "n^2",
        avgTime: "n^2",
        bestTime: "n",
        worstSpace: "1",
        avgSpace: "1",
        bestSpace: "1",
        stable: true,
        wikipediaURL: "https://en.wikipedia.org/wiki/Insertion_sort",
        videos: [("Algo Rythmics", "ROalU379l3U"), ("Geeks for Geeks", "OGzPmgsI-pQ"), ("Yusuf Shakeel (no audio)", "UUswQbT6xQc")]
    )
    
    static var selectionSort = Algorithm.init(
        id: 1,
        name: "Selection sort",
        type: "Selection",
        readability: "",
        worstTime: "n^2",
        avgTime: "n^2",
        bestTime: "n^2",
        worstSpace: "1",
        avgSpace: "1",
        bestSpace: "1",
        stable: false,
        wikipediaURL: "https://en.wikipedia.org/wiki/Selection_sort",
        videos: [("Algo Rythmics", "Ns4TPTC8whw"), ("Geeks for Geeks", "xWBP4lzkoyM"), ("Yusuf Shakeel (no audio)", "Aq2E47uU2ao")]
    )
    
    static var bubbleSort = Algorithm.init(
        id: 2,
        name: "Bubble sort",
        type: "Exchanging",
        readability: "",
        worstTime: "n^2",
        avgTime: "n^2",
        bestTime: "n",
        worstSpace: "1",
        avgSpace: "1",
        bestSpace: "1",
        stable: true,
        wikipediaURL: "https://en.wikipedia.org/wiki/Bubble_sort",
        videos: [("Algo Rythmics", "lyZQPjUT5B4"), ("HackerRank","6Gv8vg0kcHc"), ("Geeks for Geeks", "nmhjrI-aW5o")]
    )
    
    /*static var pancakeSort = Algorithm.init(
        id: 3,
        name: "Pancake sort",
        type: "Reversing first n elements",
        readability: "",
        worstTime: "n^2",
        avgTime: "n^2",
        bestTime: "n^2",
        worstSpace: "1",
        avgSpace: "1",
        bestSpace: "1",
        stable: true,
        wikipediaURL: "https://en.wikipedia.org/wiki/Pancake_sorting",
        codeAlgoRythmics: "",
        codeHackerRank: "",
        codeGeeksForGeeks: ""
    )*/
    
    static var radixSort = Algorithm.init(
        id: 3,
        name: "Radix sort",
        type: "Distribution (Non-comparison)",
        readability: "",
        worstTime: "nk",
        avgTime: "nk",
        bestTime: "nk",
        worstSpace: "n + k",
        avgSpace: "n + k",
        bestSpace: "n + k",
        stable: true,
        wikipediaURL: "https://en.wikipedia.org/wiki/Radix_sort",
        videos: [("Geeks for Geeks", "nu4gDuFabIM"), ("CS Dojo", "XiuSW_mEn7g"), ("Yusuf Shakeel (no audio)", "YXFI4osELGU")]
    )
    
    static var bucketSort = Algorithm.init(
        id: 4,
        name: "Bucket sort",
        type: "Distribution (Non-comparison)",
        readability: "",
        worstTime: "n^2",
        avgTime: "n + k",
        bestTime: "n + k",
        worstSpace: "n",
        avgSpace: "n",
        bestSpace: "n",
        stable: true,
        wikipediaURL: "https://en.wikipedia.org/wiki/Bucket_sort",
        videos: [("Geeks for Geeks", "VuXbEb5ywrU"), ("Mobile Computer Science Principles", "je0bBZxfmMM"), ("Yusuf Shakeel (no audio)", "geVyIsFpxUs")]
    )
    
    static var countingSort = Algorithm.init(
        id: 5,
        name: "Counting sort",
        type: "Distribution (Non-comparison)",
        readability: "",
        worstTime: "n + k",
        avgTime: "n + k",
        bestTime: "n + k",
        worstSpace: "n + k",
        avgSpace: "n + k",
        bestSpace: "n + k",
        stable: true,
        wikipediaURL: "https://en.wikipedia.org/wiki/Counting_sort",
        videos: [("Geeks for Geeks", "7zuGmKfUt7s"), ("CS Dojo", "OKd534EWcdk"), ("Yusuf Shakeel (no audio)", "TTnvXY82dtM")]
    )
    //static var quickSort = Algorithm.init(id: 0, name: "Quicksort", type: "", readability: "", worstTime: "O(n^2)", avgTime: "O(n log n)", bestTime: "O(n log n)", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    static var mergeSort = Algorithm.init(
        id: 6,
        name: "Merge sort",
        type: "Merging",
        readability: "",
        worstTime: "n log n",
        avgTime: "n log n",
        bestTime: "n log n",
        worstSpace: "n",
        avgSpace: "n",
        bestSpace: "n",
        stable: true,
        wikipediaURL: "https://en.wikipedia.org/wiki/Merge_sort",
        videos: [("Algo Rythmics", "XaqR3G_NVoo"), ("HackerRank","KF2j-9iSf4Q"), ("Geeks for Geeks", "JSceec-wEyw")]
    )
    
    //static var countingSort = Algorithm.init(id: 8, name: "Counting sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    //static var radixSort = Algorithm.init(id: 8, name: "Counting sort", type: "", readability: "", worstTime: "O(n log n)", avgTime: "O(n log n)", bestTime: "fes", worstSpace: "fes", avgSpace: "fes", bestSpace: "fes", wikipediaURL: "fes", codeAlgoRythmics: "ywWBy6J5gz8", codeHackerRank: "SLauY6PpjW4", codeGeeksForGeeks: "PgBzjlCcFvc")
    
    /* static var heapSort = Algorithm.init(
     id: 4,
     name: "Heap sort",
     type: "",
     readability: "",
     worstTime: "O(n log n)",
     avgTime: "O(n log n)",
     bestTime: "fes",
     worstSpace: "fes",
     avgSpace: "fes",
     bestSpace: "fes",
     wikipediaURL: "fes",
     codeAlgoRythmics: "ywWBy6J5gz8",
     codeHackerRank: "SLauY6PpjW4",
     codeGeeksForGeeks: "PgBzjlCcFvc"
     )*/
    
    static var algosArray = [insertionSort, selectionSort, bubbleSort, radixSort, bucketSort, countingSort, mergeSort]
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
    
    var videos: [(String, String)]
    
    var stable: Bool
    
    init(id: Int, name: String, type: String, readability: String, worstTime: String, avgTime: String, bestTime: String, worstSpace: String, avgSpace: String, bestSpace: String, stable: Bool, wikipediaURL: String, videos: [(String, String)]) {
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
        
        self.videos = videos
        
        self.stable = stable
    }
}
