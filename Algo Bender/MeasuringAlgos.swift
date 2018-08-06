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

    deinit {
        textView = nil
    }
    
    override func viewDidLayoutSubviews() {
        textView.setContentOffset(.zero, animated: false)
    }
}
