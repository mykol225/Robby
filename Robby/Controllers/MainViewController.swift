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
        let passInfoTest: String = "the info was passed!" //test info to be passed to destination view controller

        if segue.identifier == "openNewItem" {
            let destinationVC = segue.destination as! AddNewViewController
            destinationVC.passedInfo = passInfoTest //just a test to pass info from this view to the destination view controller
            destinationVC.addNewSubDelegate = self
        }
    }
}

// creates the actual tableView and it's cells
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscriptions.subsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? TableViewCell else {
            return UITableViewCell()
        }
        
        let sub = subscriptions.subsArray[indexPath.row]
        cell.setSubs(cell: sub)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("the cell at \(indexPath.row) has been selected")
        // add action to open addNewViewController with info added
    }
}

// Bring AddNewSubDelegate into this MainViewController so we can do something with the data
extension MainViewController: AddNewSubDelegate {
    func newSub(name: String, description: String, amount: String, period: String, icon: String) {
        let returnedCell = Cell(icon: UIImage(systemName: icon), name: name, amount: amount, description: description, period: period)
        refresh(returnedCell: returnedCell)
    }
}

// Bug1:
// Have to click a cell twice (most of the time) to open AddNewViewController modal.
// First click changes the selection state
// Second click (anywhere on screen) opens the modal.
// Removing

// Bug2:
// Opening AddNewViewController from clicking a cell
// Then choosing Add New button causes a crash


// todo
// add an action to function didSelectRowAt [row 66 in code]
// that opens addNewViewController with that cell's info
// set to the textfield's UITextField.text


// todo
// figure out how to store that info. so it's still there when user returns
