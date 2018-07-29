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

    @IBOutlet var HackerRank: WKWebView!
    @IBOutlet var GeeksForGeeks: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HackerRank.load(ytCodeToRequest(code: "SLauY6PpjW4"))
        GeeksForGeeks.load(ytCodeToRequest(code: "SLauY6PpjW4"))
    }
    
    func ytCodeToRequest(code: String) -> URLRequest {
        let urlAsString = "https://www.youtube-nocookie.com/embed/"+code+"?rel=0&amp;showinfo=0"
        let url = URL(string: urlAsString)
        return URLRequest(url: url!)
    }
    
    deinit {
        HackerRank = nil
        GeeksForGeeks = nil
    }

}
