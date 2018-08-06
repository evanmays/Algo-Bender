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
        super.viewDidLayoutSubviews()
        textView.setContentOffset(.zero, animated: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textView.flashScrollIndicators()
    }
}
