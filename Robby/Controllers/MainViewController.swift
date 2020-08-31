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
    
    var subs: [Cell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        remainExAmount.text = "$900.00"
        payPeriod.text = "Next paycheck"
        
        subs = createArray()
    }
    
    func createArray() -> [Cell] {
        var tempCellArray: [Cell] = []
        
        let tempImage: UIImage = UIImage()
            
        let cell1 = Cell(icon: UIImage(systemName: "hare.fill") ?? tempImage, name: "Petco Delivery", amount: "$56.45", description: "On Cap One Card", period: "Today")
        let cell2 = Cell(icon: UIImage(systemName: "tv.fill") ?? tempImage, name: "Netflix", amount: "$13.55", description: "", period: "Tomorrow")
        let cell3 = Cell(icon: UIImage(systemName: "car.fill") ?? tempImage, name: "Car Wash", amount: "$55.00", description: "", period: "1 day")
        let cell4 = Cell(icon: UIImage(systemName: "keyboard") ?? tempImage, name: "Google Domains (auto)", amount: "$12.99", description: "Personal website", period: "3 days")
        let cell5 = Cell(icon: UIImage(systemName: "music.note") ?? tempImage, name: "Spotify", amount: "$10.82", description: "", period: "5 days")
        let cell6 = Cell(icon: UIImage(systemName: "bolt.fill") ?? tempImage, name: "Xcel Energy", amount: "$34.00", description: "", period: "5 days")
        let cell7 = Cell(icon: UIImage(systemName: "house.fill") ?? tempImage, name: "Rent", amount: "$1312.00", description: "", period: "1 week")
        let cell8 = Cell(icon: UIImage(systemName: "arrow.down.doc") ?? tempImage, name: "Dropbox", amount: "$9.99", description: "", period: "3 weeks")
        let cell9 = Cell(icon: UIImage(systemName: "phone.fill") ?? tempImage, name: "Verizon", amount: "$144.41", description: "", period: "1  month")
                
        tempCellArray.append(cell1)
        tempCellArray.append(cell2)
        tempCellArray.append(cell3)
        tempCellArray.append(cell4)
        tempCellArray.append(cell5)
        tempCellArray.append(cell6)
        tempCellArray.append(cell7)
        tempCellArray.append(cell8)
        tempCellArray.append(cell9)
        
        return tempCellArray
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sub = subs[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as! TableViewCell
        
        cell.setSubs(cell: sub)
        
        return cell
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        print("Add button pressed")
        self.performSegue(withIdentifier: "openNewItem", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passInfoTest = "the info was passed!"

        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! AddNewViewController
            
            destinationVC.passedInfo = passInfoTest
//            destinationVC.bmiValue = calculatorBrain.getBMIValue()
//            destinationVC.advice = calculatorBrain.getAdvice()
//            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}
