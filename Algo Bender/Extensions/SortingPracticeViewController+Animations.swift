//
//  SortingPracticeViewController+Animations.swift
//  Algo Bender
//
//  Created by Evan Mays on 8/17/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit

extension SortingPracticeViewController {
    
    func shrinkBigButtons() {
        shuffleAndNewSortConstraint.constant = 0
        shuffleConstraintTop.constant = 0
        SortConstraintBottom.constant = 0
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            self.shuffleBtn.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.newSortedArrayBtn.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.view.layoutIfNeeded()
            }
        })
    }
    
    func growSmallButtons() {
        shuffleAndNewSortConstraint.constant = 8
        shuffleConstraintTop.constant = 8
        SortConstraintBottom.constant = 20
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            //UNDO THE TRANSFORM
            self.shuffleBtn.transform = .identity
            self.newSortedArrayBtn.transform = .identity
            self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.view.layoutIfNeeded()
            }
        })
    }
}
