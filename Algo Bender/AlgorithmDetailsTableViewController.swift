//
//  AlgorithmDetailsTableViewController.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/29/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import WebKit

class AlgorithmDetailsTableViewController: UITableViewController {

    var algo: Algorithm? = nil
    @IBOutlet var AlgoRythmics: WKWebView!
    @IBOutlet var HackerRank: WKWebView!
    @IBOutlet var GeeksForGeeks: WKWebView!
    
    @IBOutlet var worstTime: UILabel!
    @IBOutlet var avgTime: UILabel!
    @IBOutlet var bestTime: UILabel!
    @IBOutlet var worstSpace: UILabel!
    @IBOutlet var avgSpace: UILabel!
    @IBOutlet var bestSpace: UILabel!

    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        worstTime.text = algo!.worstTime
        avgTime.text = algo!.avgTime
        bestTime.text = algo!.bestTime
        worstSpace.text = algo!.worstSpace
        avgSpace.text = algo!.avgSpace
        bestSpace.text = algo!.bestSpace
        
        AlgoRythmics.load(ytCodeToRequest(code: algo!.codeAlgoRythmics))
        HackerRank.load(ytCodeToRequest(code: algo!.codeHackerRank))
        GeeksForGeeks.load(ytCodeToRequest(code: algo!.codeGeeksForGeeks))
    }
    
    func ytCodeToRequest(code: String) -> URLRequest {
        let urlAsString = "https://www.youtube-nocookie.com/embed/"+code+"?rel=0&amp;showinfo=0"
        let url = URL(string: urlAsString)
        return URLRequest(url: url!)
    }
    
    deinit {
        AlgoRythmics = nil
        HackerRank = nil
        GeeksForGeeks = nil
        worstTime = nil
        avgTime = nil
        bestTime = nil
        worstSpace = nil
        avgSpace = nil
        bestSpace = nil
    }

}
