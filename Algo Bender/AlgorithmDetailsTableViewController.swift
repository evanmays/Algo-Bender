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
    
    var hiddenCells: [UITableViewCell] = []
    
    @IBOutlet var worstTime: UILabel!
    @IBOutlet var avgTime: UILabel!
    @IBOutlet var bestTime: UILabel!
    @IBOutlet var worstSpace: UILabel!
    @IBOutlet var avgSpace: UILabel!
    @IBOutlet var bestSpace: UILabel!
    
    @IBOutlet var algorithmType: UILabel!
    @IBOutlet var algorithmReadability: UILabel!
    @IBOutlet var wikipediaRow: UITableViewCell!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = algo!.name
        algorithmType.text = algo!.type
        algorithmReadability.text = algo!.readability
        
        worstTime.text = algo!.worstTime
        avgTime.text = algo!.avgTime
        bestTime.text = algo!.bestTime
        worstSpace.text = algo!.worstSpace
        avgSpace.text = algo!.avgSpace
        bestSpace.text = algo!.bestSpace
        
        if (algo!.codeHackerRank == "") {
            hiddenCells.append(HackerRank.superview!.superview! as! UITableViewCell)
        }
        if (algo!.codeAlgoRythmics == "") {
            hiddenCells.append(AlgoRythmics.superview!.superview! as! UITableViewCell)
        }
        if (algo!.codeGeeksForGeeks == "") {
            hiddenCells.append(GeeksForGeeks.superview!.superview! as! UITableViewCell)
        }
        
        AlgoRythmics.load(ytCodeToRequest(code: algo!.codeAlgoRythmics))
        HackerRank.load(ytCodeToRequest(code: algo!.codeHackerRank))
        GeeksForGeeks.load(ytCodeToRequest(code: algo!.codeGeeksForGeeks))
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        for hidecell in hiddenCells {
            if hidecell == cell {
                return 0
            }
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)! == wikipediaRow {
            showWikipedia()
        }
    }
    
    func ytCodeToRequest(code: String) -> URLRequest {
        let urlAsString = "https://www.youtube-nocookie.com/embed/"+code+"?rel=0&amp;showinfo=0"
        let url = URL(string: urlAsString)
        return URLRequest(url: url!)
    }
    
    func showWikipedia() {
        
        let myFrame = view.bounds// CGRect(x: 0, y: 0, width: <#T##Int#>, height: <#T##Int#>)
        let webView = WKWebView(frame: myFrame)
        
        let url = URL(string: algo!.wikipediaURL)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
        view.addSubview(webView)
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
