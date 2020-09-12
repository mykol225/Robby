//
//  Subscriptions.swift
//  Robby
//
//  Created by Michael Worthington on 8/31/20.
//  Copyright © 2020 Michael Worthington. All rights reserved.
//

import UIKit

class Subscriptions {
    
    var subsArray: [Cell] = []
    
    func newSub(addedCell: Cell) {
        subsArray.append(addedCell)
    }
    
    func isSubsArrayEmpty() -> Bool {
        subsArray.count < 1 ? true : false
    }
}
