//
//  CFEHeaderCellTableViewCell.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 6/15/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import UIKit

class CFEHeaderCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!

    var titulo: String? {
        didSet {
            headerLabel?.text = titulo
        }
    }

}
