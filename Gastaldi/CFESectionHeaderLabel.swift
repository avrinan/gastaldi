//
//  MySectionHeaderLabel.swift
//  Tablas
//
//  Created by Daniel Bonini on 6/19/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import UIKit

class CFESectionHeaderLabel: UILabel {

    var titulo = "" {
        didSet {
            self.text = titulo
            self.textColor = UIColor.white
            self.textAlignment = NSTextAlignment.left
            self.backgroundColor = UIColor(red: 139/255, green: 195/255, blue: 74/255, alpha: 1)
        }
    }

}
