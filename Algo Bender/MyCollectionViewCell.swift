//
//  MyCollectionViewCell.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/27/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit

@IBDesignable
class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var valueWrapper: UIView!
    
    func configure(value: Int, position: Int) {
        self.position.text = String(position)
        self.value.text = String(value)
    }
    
    func selected() {
        backgroundColor = UIColor.red
    }
    
    func unselected() {
        backgroundColor = UIColor.lightGray
    }
    
    func turnGreen() {
        backgroundColor = UIColor.init(red: 115 / 255.0, green: 250 / 255.0, blue: 121 / 255.0, alpha: 1)
    }
}
