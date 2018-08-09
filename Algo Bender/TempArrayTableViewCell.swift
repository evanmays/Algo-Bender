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
        if (cellIsSelected(index: i)) {
            cell.selected()
        }
        return cell
    }
    
    func cellIsSelected(index: Int) -> Bool {
        if (index == sortingPracticeView.selected.0 && sortingPracticeView.selectedFromArr.0 == currTempArrNumber) {
            return true
        }
        if (index == sortingPracticeView.selected.1 && sortingPracticeView.selectedFromArr.1 == currTempArrNumber) {
            return true
        }
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (sortingPracticeView.swapEnabled) {
            if (sortingPracticeView.selected == (nil, nil)) {
                sortingPracticeView.selected.0 = indexPath.item
                sortingPracticeView.selectedFromArr.0 = currTempArrNumber
                collectionView.reloadData()
            }
            else {
                //selected is (something, nil)
                sortingPracticeView.selected.1 = indexPath.item
                sortingPracticeView.selectedFromArr.1 = currTempArrNumber
                sortingPracticeView.swapSelected()
            }
        }
        else if (sortingPracticeView.copyEnabled) {
            
            if (sortingPracticeView.selected == (nil, nil)) {
                sortingPracticeView.selected.0 = indexPath.item
                sortingPracticeView.selectedFromArr.0 = currTempArrNumber
                collectionView.reloadData()
            }
            else {
                sortingPracticeView.selected.1 = indexPath.item
            sortingPracticeView.selectedFromArr.1 = currTempArrNumber
                sortingPracticeView.copySelected()
            }
        }
    }
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == .began {
            let touchPoint = longPressGestureRecognizer.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: touchPoint) {
                if (sortingPracticeView.flipEnabled) {
                    flipNumbers(n: indexPath.item)
                }
            }
        }
    }
    
    func flipNumbers(n: Int) {
        var temp: [Int] = []
        for i in 0...n {
            temp.insert(items[i], at: 0)
        }
        for i in 0...n {
            items[i] = temp[i]
        }
        collectionView.reloadData()
    }
    
    deinit {
        collectionView = nil
        cellLabel = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
