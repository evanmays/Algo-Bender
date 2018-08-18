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
    
    var practiceArrs: PracticeArrays = PracticeArrays()
    
    var selected: Int? = nil
    var selectedFromArr: Int? = nil //0...n is temp arrays. -1 is main array
    
    var sorted = true
    
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var shuffleBtn: UIButton!
    @IBOutlet var newSortedArrayBtn: UIButton!
    @IBOutlet var shuffleAndNewSortConstraint: NSLayoutConstraint!
    @IBOutlet var shuffleConstraintTop: NSLayoutConstraint!
    @IBOutlet var SortConstraintBottom: NSLayoutConstraint!
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var numberOfTempArrays: UILabel!
    
    @IBOutlet var controlInstructions: UITextView!
    
    var action: String = "swapEnabled"
    
    //Initialize and Deinitialize Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        recognizer.delegate=self
        view.addGestureRecognizer(recognizer)
        self.navigationItem.leftBarButtonItem?.isEnabled = false
    }

    deinit {
        collectionView = nil
        tableView = nil
        stepper = nil
    }
    
    //Main Array's Collection View Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return practiceArrs.getArray(pos: -1).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "address", for: indexPath) as! MyCollectionViewCell
        let i = indexPath.item
        cell.configure(value: practiceArrs.getItemInArr(arrNum: -1, item: i), position: i)
        cell.unselected()
        if (self.sorted) {
            cell.turnGreen()
        }
        if (i == selected && selectedFromArr == -1) {
            cell.selected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (action == "swapEnabled") {
            if (selected == nil) {
                selected = indexPath.item
                selectedFromArr = -1
                collectionView.reloadData()
                tableView.reloadData()
            }
            else {
                practiceArrs.swapNums(firstArrNum: selectedFromArr!, firstItem: selected!, secondArrNum: -1, secondItem: indexPath.item)
                reloadCollection()
            }
        }
        else if (action == "copyEnabled") {
            if (selected == nil) {
                selected = indexPath.item
                selectedFromArr = -1
                collectionView.reloadData()
                tableView.reloadData()
            }
            else {
                //selected is (something, nil)
                practiceArrs.copyNums(firstArrNum: selectedFromArr!, firstItem: selected!, secondArrNum: -1, secondItem: indexPath.item)
                reloadCollection()
            }
        }
    }
    
    @IBAction func shuffleNumbers(_ sender: UIButton) {
        practiceArrs.shuffleNums()
        reloadCollection()
    }
    
    
    @IBAction func newNumbers(_ sender: UIButton) {
        practiceArrs.newNums()
        reloadCollection()
    }
    
    func reloadCollection() {
        practiceArrs.saveChange()
        selected = nil
        selectedFromArr = nil
        sorted = practiceArrs.getArray(pos: -1).isSorted()
        self.navigationItem.leftBarButtonItem?.isEnabled = practiceArrs.weShouldEnableUndo()
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == .began {
            let touchPoint = longPressGestureRecognizer.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: touchPoint) {
                if (action == "flipEnabled") {
                    practiceArrs.flipNums(n: indexPath.item)
                    reloadCollection()
                }
            }
        }
    }
    
    /* Temporary Arrays' Table View Functions */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return practiceArrs.numOfTemps() + 1 //1 is for spacer cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.item == practiceArrs.numOfTemps()) {
            return tableView.dequeueReusableCell(withIdentifier: "spacerCell", for: indexPath)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "tempArrayCell", for: indexPath) as! TempArrayTableViewCell
        cell.sortingPracticeView = self
        cell.setup(index: indexPath.item)
        return cell
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        let actions = [
            ("swapEnabled", "To swap two numbers:\nTap one element, then tap another element."),
            ("flipEnabled", "To flip the first z Ints:\nHold your tap on the zth element."),
            ("copyEnabled", "To copy a number:\nTap src element, then tap dst position."),
            ("plusplusEnabled", "To increment a number:\nHold your tap on its element."),
            ("minusminusEnabled", "To decrement a number:\nHold your tap on its element"),
        ]
        action = actions[sender.selectedSegmentIndex].0
        controlInstructions.text = actions[sender.selectedSegmentIndex].1
        reloadCollection()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfTempArrs(num: Int(sender.value))
        reloadCollection()
    }
    
    func updateNumberOfTempArrs(num: Int) {
        practiceArrs.updateTempCount(num)
        numberOfTempArrays.text = num.description + " Temp Arrays"
        if (num > 0) {
            //shrink Shuffle Order and New Sorted Array buttons
            shrinkBigButtons()
        }
        else {
            //grow Shuffle Order and New Sorted Array buttons
            growSmallButtons()
        }
    }
    
    @IBAction func undoBtnPressed(_ sender: UIBarButtonItem) {
        practiceArrs.undo()
        updateNumberOfTempArrs(num: practiceArrs.numOfTemps())
        stepper.value = Double(practiceArrs.numOfTemps())
        reloadCollection()
    }
}
