//
//  MainViewController.swift
//  Algo Bender
//
//  Created by Evan Mays on 8/6/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    override func viewDidLayoutSubviews() {
        textView.setContentOffset(.zero, animated: false)
    }
}
