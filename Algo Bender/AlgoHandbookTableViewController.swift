//
//  AlgoHandbookTableViewController.swift
//  Algo Bender
//
//  Created by Evan Mays on 7/29/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit

class AlgoHandbookTableViewController: UITableViewController {
    
    var selectedAlgo: Algorithm? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var i = indexPath.item
        if i >= Algorithms.algosArray.count {
            i -= Algorithms.algosArray.count
        }
        selectedAlgo = Algorithms.algosArray[i]
        performSegue(withIdentifier: "detail", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let detailViewController = segue.destination as? AlgorithmDetailsTableViewController {
                detailViewController.algo = selectedAlgo!
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Time Complexities"
        }
        return "Space Complexities"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "algoRow", for: indexPath) as! MyTableViewCell
        
        
        cell.name.text = Algorithms.algosArray[indexPath.row].name
        
        if indexPath.section == 0{
            cell.complexity.text = Algorithms.algosArray[indexPath.row].avgTime
        }
        else {
            cell.complexity.text = Algorithms.algosArray[indexPath.row].avgSpace
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Algorithms.algosArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
