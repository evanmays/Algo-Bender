//
//  SortingPracticeViewController.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/27/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import WebKit

class MeasuringAlgosViewController: UIViewController{
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var hackerRank: WKWebView!
    @IBOutlet var undefinedBehavior: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        hackerRank.load(ytCodeToRequest(code: "v4cd1O4zkGw"))
        undefinedBehavior.load(ytCodeToRequest(code: "MyeV2_tGqvw"))
    }
    
    deinit {
        textView = nil
        hackerRank = nil
        undefinedBehavior = nil
    }
    
    override func viewDidLayoutSubviews() {
        textView.setContentOffset(.zero, animated: false)
    }
}
