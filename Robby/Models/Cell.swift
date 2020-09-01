//
//  Cell.swift
//  Robby
//
//  Created by Michael Worthington on 8/30/20.
//  Copyright © 2020 Michael Worthington. All rights reserved.
//

import UIKit

class Cell {
    let name: String
    let amount: String
    let description: String
    let period: String
    let icon: UIImage?
    
    init(icon: UIImage?, name: String, amount: String, description: String, period: String) {
        self.icon = icon
        self.name = name
        self.amount = amount
        self.description = description
        self.period = period
    }
}
