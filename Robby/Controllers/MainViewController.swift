//
//  MainViewController.swift
//  Robby
//
//  Created by Michael Worthington on 8/30/20.
//  Copyright © 2020 Michael Worthington. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var remainingExpenses: UILabel!
    @IBOutlet weak var payPeriod: UILabel!
    @IBOutlet weak var remainExAmount: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    let subscriptions = Subscriptions()
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresher = UIRefreshControl()
        remainExAmount.text = "$900.00"
        payPeriod.text = "Next paycheck"
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func refresh(returnedCell: Cell) {
        subscriptions.newSub(addedCell: returnedCell)
        self.tableView.reloadData()
        self.refresher.endRefreshing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("why the fuck does this run before tableView didSelect??")
        if segue.identifier == "openNewItem" {
            print("openNewItem segue")
            let destinationVC = segue.destination as! AddNewViewController
            destinationVC.addNewSubDelegate = self  //needs to run or crash
        } else if segue.identifier == "editCell" {
        print("editCell segue")
        let destinationVC = segue.destination as! AddNewViewController
        destinationVC.addNewSubDelegate = self  //needs to run or crash{
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscriptions.subsArray.count
    }
    // creates the actual tableView and it's cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? TableViewCell else {
            return UITableViewCell()
        }
        let sub = subscriptions.subsArray[indexPath.row]
        cell.setSubs(cell: sub)
        return cell
    }
    // does an action on cell that is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell has been selected")
        // add action to open addNewViewController with info added
        let selectedCell = tableView.cellForRow(at: indexPath) as? TableViewCell
        let selectedCellName = selectedCell?.cellName.text ?? "nil found"
        print(selectedCellName)
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            print("Preparing for segue")
//            if segue.identifier == "editCell" {
//                print("Segue is editCell")
//                let destinationVC = segue.destination as! AddNewViewController
//                destinationVC.passedName = selectedCellName
//                print("passed name is \(destinationVC.passedName)")
//                destinationVC.addNewSubDelegate = self
//            }
//        }
    }
}

// Bring AddNewSubDelegate into this MainViewController so we can do something with the data
extension MainViewController: AddNewSubDelegate {
    func newSub(name: String, description: String, amount: String, period: String, icon: String) {
        let returnedCell = Cell(icon: UIImage(systemName: icon), name: name, amount: amount, description: description, period: period)
        refresh(returnedCell: returnedCell)
    }
    // need a func for editSub that
}


// todo
// how to pass data from existing cell to addNewViewController
// figure out how to store that Data. so it's still there when user open the app



// current issues
// Can't figure out how to pass info from existing cell to addNewViewController
// Function "prepare for seque" is running BEFORE the function tableView didSelectRowAtIndexPath.
// so the wrong/old passedName is being passed and ran before the correct name has been updated.

// What I want it to do
// Clicking an existing cell, sends the cell's data to the edit(AddNew) view controller
// and fills in the information.

// also crashes when selecting an existing cell and hitting "add new" button
// I think it has to do with addNewSubDelegate not being 
