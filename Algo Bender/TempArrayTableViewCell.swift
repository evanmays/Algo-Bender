//
//  TempArrayTableViewCell.swift
//  Algo Bender
//
//  Created by Evan Mays on 8/8/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit

class TempArrayTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var cellLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let recognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        recognizer.delegate=self
        addGestureRecognizer(recognizer)
    }
    
    func setup(index: Int) {
        items = sortingPracticeView.practiceArrs.getArray(pos: index)
        currTempArrNumber = index
        cellLabel.text = "Temp Arr " + String(index)
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var currTempArrNumber: Int!
    var sortingPracticeView: SortingPracticeViewController!
    
    var items: [Int] = []
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "address", for: indexPath) as! MyCollectionViewCell
        let i = indexPath.item
        cell.configure(value: self.items[i], position: i)
        
        cell.unselected()
        if (i == sortingPracticeView.selected && sortingPracticeView.selectedFromArr == currTempArrNumber) {
            cell.selected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (sortingPracticeView.action == "swapEnabled") {
            if (sortingPracticeView.selected == nil) {
                sortingPracticeView.selected = indexPath.item
                sortingPracticeView.selectedFromArr = currTempArrNumber
                collectionView.reloadData()
            }
            else {
                sortingPracticeView.practiceArrs.swapNums(firstArrNum: sortingPracticeView.selectedFromArr!, firstItem: sortingPracticeView.selected!, secondArrNum: currTempArrNumber, secondItem: indexPath.item)
                sortingPracticeView.reloadCollection()
            }
        }
        else if (sortingPracticeView.action == "copyEnabled") {
            
            if (sortingPracticeView.selected == nil) {
                sortingPracticeView.selected = indexPath.item
                sortingPracticeView.selectedFromArr = currTempArrNumber
                collectionView.reloadData()
            }
            else {
                sortingPracticeView.practiceArrs.copyNums(firstArrNum: sortingPracticeView.selectedFromArr!, firstItem: sortingPracticeView.selected!, secondArrNum: currTempArrNumber, secondItem: indexPath.item)
                sortingPracticeView.reloadCollection()
            }
        }
    }
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == .began {
            let touchPoint = longPressGestureRecognizer.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: touchPoint) {
                if (sortingPracticeView.action == "flipEnabled") {
                    sortingPracticeView.practiceArrs.flipNums(arrNum: currTempArrNumber, n: indexPath.item)
                    sortingPracticeView.reloadCollection()
                }
                else if (sortingPracticeView.action == "plusplusEnabled") {
                    sortingPracticeView.practiceArrs.plusplusNumber(arrNum: currTempArrNumber, i: indexPath.item)
                    sortingPracticeView.reloadCollection()
                }
                else if (sortingPracticeView.action == "minusminusEnabled") {
                    sortingPracticeView.practiceArrs.minusminusNumber(arrNum: currTempArrNumber, i: indexPath.item)
                    sortingPracticeView.reloadCollection()
                }
            }
        }
    }
    
    deinit {
        collectionView = nil
        cellLabel = nil
    }

}
