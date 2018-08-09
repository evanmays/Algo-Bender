//
//  SortingPracticeViewController.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/27/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import WebKit

class SortingPracticeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var numTempArrays: Int! = 0
    
    var tempArrays: [[Int]] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numTempArrays + 1 //1 is for spacer cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.item == numTempArrays) {
            return tableView.dequeueReusableCell(withIdentifier: "spacerCell", for: indexPath)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "tempArrayCell", for: indexPath) as! TempArrayTableViewCell
        cell.sortingPracticeView = self
        cell.currTempArrNumber = indexPath.item
        cell.items = tempArrays[indexPath.item]
        cell.cellLabel.text = "Temp Arr " + String(indexPath.item)
        cell.collectionView.reloadData()
        
        return cell
    }
    
    
    @IBOutlet var textView: UITextView!
    
    var savedPositions = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var selected: (Int?, Int?) = (nil, nil)
    var selectedFromArr: (Int?, Int?) = (nil, nil) //0...n is temp arrays. -1 is main array
    
    var sorted = true
    
    @IBOutlet var shuffleBtn: UIButton!
    @IBOutlet var newSortedArrayBtn: UIButton!
    @IBOutlet var shuffleAndNewSortConstraint: NSLayoutConstraint!
    @IBOutlet var shuffleConstraintTop: NSLayoutConstraint!
    @IBOutlet var SortConstraintBottom: NSLayoutConstraint!
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var numberOfTempArrays: UILabel!
    
    @IBOutlet var controlInstructions: UITextView!
    
    var swapEnabled: Bool = true
    var flipEnabled: Bool = false
    var copyEnabled: Bool = false
    var plusplusEnabled: Bool = false
    var minusminusEnabled: Bool = false
    
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
        tableView = nil
    }
    
    override func viewDidLayoutSubviews() {
        //textView.setContentOffset(.zero, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "address", for: indexPath) as! MyCollectionViewCell
        let i = indexPath.item
        cell.configure(value: self.items[i], position: i)
        if (!cellIsSelected(index: i)) {
            cell.unselected()
        }
        if (self.sorted) {
            cell.turnGreen()
        }
        if (cellIsSelected(index: i)) {
            cell.selected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (swapEnabled) {
            if (selected == (nil, nil)) {
                selected.0 = indexPath.item
                selectedFromArr.0 = -1
                collectionView.reloadData()
                tableView.reloadData()
            }
            else {
                //selected is (something, nil)
                selected.1 = indexPath.item
                selectedFromArr.1 = -1
                swapSelected()
            }
        }
        else if (copyEnabled) {
            if (selected == (nil, nil)) {
                selected.0 = indexPath.item
                selectedFromArr.0 = -1
                collectionView.reloadData()
                tableView.reloadData()
            }
            else {
                //selected is (something, nil)
                selected.1 = indexPath.item
                selectedFromArr.1 = -1
                copySelected()
            }
        }
    }
    
    func swapSelected() {
        var firstVal = 0
        var secondVal = 0
        
        //get firstval and secondval
        if (selectedFromArr.0! == -1) {
            firstVal = items[selected.0!]
        }
        else {
            firstVal = tempArrays[selectedFromArr.0!][selected.0!]
        }
        if (selectedFromArr.1! == -1) {
            secondVal = items[selected.1!]
        }
        else {
            secondVal = tempArrays[selectedFromArr.1!][selected.1!]
        }
        
        //swap them
        if (selectedFromArr.0! == -1) {
            items[selected.0!] = secondVal
        }
        else {
            tempArrays[selectedFromArr.0!][selected.0!] = secondVal
        }
        if (selectedFromArr.1! == -1) {
            items[selected.1!] = firstVal
        }
        else {
            tempArrays[selectedFromArr.1!][selected.1!] = firstVal
        }
        
        reloadCollection()
    }
    
    func copySelected() {
        var src = 0;
        if (selectedFromArr.0! == -1) {
            src = items[selected.0!]
        }
        else {
            src = tempArrays[selectedFromArr.0!][selected.0!]
        }
        
        if (selectedFromArr.1! == -1) {
            items[selected.1!] = src
        }
        else {
            tempArrays[selectedFromArr.1!][selected.1!] = src
        }
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
        selectedFromArr = (nil, nil)
        sorted = isSorted(arr: items)
        collectionView.reloadData()
        tableView.reloadData()
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
            controlInstructions.text = "To swap two numbers:\nTap one element, then tap another element."
            swapEnabled = true
            flipEnabled = false
            copyEnabled = false
            plusplusEnabled = false
            minusminusEnabled = false
        case 1:
            controlInstructions.text = "To flip the first z Ints:\nHold your tap on the zth element."
            swapEnabled = false
            flipEnabled = true
            copyEnabled = false
            plusplusEnabled = false
            minusminusEnabled = false
        case 2:
            controlInstructions.text = "To copy a number:\nTap src element, then tap dst position."
            swapEnabled = false
            flipEnabled = false
            copyEnabled = true
            plusplusEnabled = false
            minusminusEnabled = false
        case 3:
            controlInstructions.text = "To increment a number:\nHold your tap on its element."
            swapEnabled = false
            flipEnabled = false
            copyEnabled = false
            plusplusEnabled = true
            minusminusEnabled = false
        case 4:
            controlInstructions.text = "To decrement a number:\nHold your tap on its element"
            swapEnabled = false
            flipEnabled = false
            copyEnabled = false
            plusplusEnabled = false
            minusminusEnabled = true
        default:
            break
        }
        reloadCollection()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfTempArrays.text = Int(sender.value).description + " Temp Arrays"
        numTempArrays = Int(sender.value)
        if (numTempArrays > 0) {
            //shrink Shuffle Order and New Sorted Array buttons
            for i in 0 ..< numTempArrays {
                if (!tempArrays.indices.contains(i)) {
                    //ith index does not exist
                    //initialize it
                    tempArrays.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
                }
            }
            shrinkBigButtons()
        }
        else {
            tempArrays = []
            //grow Shuffle Order and New Sorted Array buttons
            growSmallButtons()
        }
        reloadCollection()
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
    
    func cellIsSelected(index: Int) -> Bool {
        if (index == selected.0 && selectedFromArr.0 == -1) {
            return true
        }
        if (index == selected.1 && selectedFromArr.1 == -1) {
            return true
        }
        return false
    }
}
