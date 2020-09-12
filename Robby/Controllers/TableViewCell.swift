//
//  TableViewCell.swift
//  Robby
//
//  Created by Michael Worthington on 8/30/20.
//  Copyright © 2020 Michael Worthington. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellAmount: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellTimeUntil: UILabel!
    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var cellContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if (selected) {
            super.setSelected(true, animated: animated)
            cellContentView.backgroundColor = UIColor.systemGray4
        } else {
            super.setSelected(false, animated: animated)
            cellContentView.backgroundColor = UIColor.systemGray6
        }
    }
    
    func setSubs(cell: Cell) {
        cellName.text = cell.name
        cellAmount.text = cell.amount
        cellDescription.text = cell.description
        cellTimeUntil.text = cell.period
        cellIcon.image = cell.icon ?? UIImage(named: "hare.fill")
    }

}
