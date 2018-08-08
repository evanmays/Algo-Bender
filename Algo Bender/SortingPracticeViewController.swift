//
//  SortingPracticeViewController.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/27/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import WebKit

class SortingPracticeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet var textView: UITextView!
    
    var savedPositions = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var selected: (Int?, Int?) = (nil, nil)
    
    var sorted = true
    
    @IBOutlet var shuffleBtn: UIButton!
    @IBOutlet var newSortedArrayBtn: UIButton!
    @IBOutlet var shuffleAndNewSortConstraint: NSLayoutConstraint!
    @IBOutlet var shuffleConstraintTop: NSLayoutConstraint!
    @IBOutlet var SortConstraintBottom: NSLayoutConstraint!
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var numberOfTempArrays: UILabel!
    
    var swapEnabled: Bool = true
    var flipEnabled: Bool = false
    var copyEnabled: Bool = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //textView.flashScrollIndicators()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        recognizer.delegate=self
        view.addGestureRecognizer(recognizer)
    }

    deinit {
        collectionView = nil
        textView = nil
    }
    
    override func viewDidLayoutSubviews() {
        //textView.setContentOffset(.zero, animated: false)
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
        if (swapEnabled) {
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
        else if (copyEnabled) {
            if (selected == (nil, nil)) {
                selected.0 = indexPath.item
                collectionView.reloadData()
            }
            else {
                //selected is (something, nil)
                selected.1 = indexPath.item
                copySelected()
            }
        }
    }
    
    func swapSelected() {
        let temp = items[selected.0!]
        items[selected.0!] = items[selected.1!]
        items[selected.1!] = temp
        reloadCollection()
    }
    
    func copySelected() {
        items[selected.1!] = items[selected.0!]
        reloadCollection()
    }
    
    @IBAction func shuffleNumbers(_ sender: UIButton) {
        //TODO: Uncomment
        //savedPositions.shuffle()
        savedPositions = shuffle(arr: savedPositions) //TODO: Remove
        items = savedPositions
        reloadCollection()
    }
    
    func flipNumbers(n: Int) {
        var temp: [Int] = []
        for i in 0...n {
            temp.insert(items[i], at: 0)
        }
        print(temp)
        for i in 0...n {
            items[i] = temp[i]
        }
        reloadCollection()
    }
    
    @IBAction func resetNumbers(_ sender: UIButton) {
        items = savedPositions
        reloadCollection()
    }
    
    @IBAction func newNumbers(_ sender: UIButton) {
        //TODO: Uncomment
        //savedPositions = [Int.random(in: 1 ... 10)]
        savedPositions = [Int(arc4random_uniform(10) + 1)] //TODO: Remove
        for i in 1...20 {
            let prev = savedPositions[i-1]
            //TODO: Uncomment
            //let next = prev + Int.random(in: 1 ... 10)
            let next = prev + Int(arc4random_uniform(10) + 1) //TODO: Remove
            savedPositions.append(next)
        }
        items = savedPositions
        reloadCollection()
    }
    
    func reloadCollection() {
        selected = (nil, nil)
        sorted = isSorted(arr: items)
        collectionView.reloadData()
    }
    
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == .began {
            let touchPoint = longPressGestureRecognizer.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: touchPoint) {
                if (flipEnabled) {
                    flipNumbers(n: indexPath.item)
                }
            }
        }
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
    
    func shuffle(arr: [Int]) -> [Int] {
        var newArr = arr
        for i in (0 ..< newArr.count).reversed() {
            let random = Int(arc4random_uniform(UInt32(i)))
            let temp = newArr[i]
            newArr[i] = newArr[random]
            newArr[random] = temp
        }
        return newArr
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            swapEnabled = true
            flipEnabled = false
            copyEnabled = false
        case 1:
            swapEnabled = false
            flipEnabled = true
            copyEnabled = false
        case 2:
            swapEnabled = false
            flipEnabled = false
            copyEnabled = true
        default:
            break
        }
        reloadCollection()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfTempArrays.text = Int(sender.value).description + " Temp Arrays"
        if (Int(sender.value) > 0) {
            //shrink Shuffle Order and New Sorted Array buttons
            shrinkBigButtons()
        }
        else {
            //grow Shuffle Order and New Sorted Array buttons
            growSmallButtons()
        }
    }
    
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
