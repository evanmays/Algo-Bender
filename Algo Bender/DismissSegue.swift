//
//  DismissSegue.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/26/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit

class DismissSegue: UIStoryboardSegue {
    override func perform() {
        self.source.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
