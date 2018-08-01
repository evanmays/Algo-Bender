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
    
    @IBOutlet var firstVideo: MyVideoTableViewCell!
    @IBOutlet var secondVideo: MyVideoTableViewCell!
    @IBOutlet var thirdVideo: MyVideoTableViewCell!

    
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
        
        
        if (!algo!.videos.indices.contains(0)) {
            hiddenCells.append(firstVideo as! UITableViewCell)
        }
        else {
            firstVideo.author.text = algo!.videos[0].0
            firstVideo.webView.load(ytCodeToRequest(code: algo!.videos[0].1))
        }
        if (!algo!.videos.indices.contains(1)) {
            hiddenCells.append(secondVideo as! UITableViewCell)
        }
        else {
            secondVideo.author.text = algo!.videos[1].0
            secondVideo.webView.load(ytCodeToRequest(code: algo!.videos[1].1))
        }
        if (!algo!.videos.indices.contains(2)) {
            hiddenCells.append(thirdVideo as! UITableViewCell)
        }
        else {
            thirdVideo.author.text = algo!.videos[2].0
            thirdVideo.webView.load(ytCodeToRequest(code: algo!.videos[2].1))
        }
        
        hiddenCells.append(algorithmReadability.superview!.superview! as! UITableViewCell)
        
        
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
        firstVideo = nil
        secondVideo = nil
        thirdVideo = nil
        worstTime = nil
        avgTime = nil
        bestTime = nil
        worstSpace = nil
        avgSpace = nil
        bestSpace = nil
    }

}
