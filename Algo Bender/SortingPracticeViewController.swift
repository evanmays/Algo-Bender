//
//  SortingPracticeViewController.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/27/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import WebKit

class SortingPracticeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var savedPositions = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var selected: (Int?, Int?) = (nil, nil)
    
    var sorted = true
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        collectionView = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "address", for: indexPath) as! MyCollectionViewCell
        let i = indexPath.item
        cell.configure(value: self.items[i], position: i)
        if (i != selected.0 && i != selected.1) {
            cell.unselected()
        }
        if (self.sorted) {
            cell.turnGreen()
        }
        if (i == selected.0 || i == selected.1) {
            cell.selected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (selected == (nil, nil)) {
            selected.0 = indexPath.item
            collectionView.reloadData()
        }
        else {
            //selected is (something, nil)
            selected.1 = indexPath.item
            swapSelected()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    func swapSelected() {
        let temp = items[selected.0!]
        items[selected.0!] = items[selected.1!]
        items[selected.1!] = temp
        reloadCollection()
    }
    
    @IBAction func shuffleNumbers(_ sender: UIButton) {
        items.shuffle()
        reloadCollection()
    }
    
    @IBAction func resetNumbers(_ sender: UIButton) {
        items = savedPositions
        reloadCollection()
    }
    
    @IBAction func newNumbers(_ sender: UIButton) {
        savedPositions = [Int.random(in: 1 ... 10)]
        for i in 1...20 {
            let prev = savedPositions[i-1]
            let next = prev + Int.random(in: 1 ... 10)
            savedPositions.append(next)
        }
        items = savedPositions
    }
    
    func reloadCollection() {
        selected = (nil, nil)
        sorted = isSorted(arr: items)
        collectionView.reloadData()
    }
    func isSorted(arr: [Int]) -> Bool {
        var curr = 0
        for next in arr {
            if next < curr {
                return false
            }
            curr = next
        }
        return true
    }
}
