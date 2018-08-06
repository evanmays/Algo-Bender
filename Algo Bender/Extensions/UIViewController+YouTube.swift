//
//  UIViewController+YouTube.swift
//  Algo Bender
//
//  Created by Evan Mays on 8/6/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import WebKit
import Foundation

extension UIViewController {
    func ytCodeToRequest(code: String) -> URLRequest {
        let urlAsString = "https://www.youtube-nocookie.com/embed/"+code+"?rel=0&amp;showinfo=0"
        let url = URL(string: urlAsString)
        return URLRequest(url: url!)
    }
}
