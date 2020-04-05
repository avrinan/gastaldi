//
//  CFETableViewCell.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 6/10/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import UIKit
import CoreData

class CFETableViewCell: UITableViewCell {
   
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var certificado : Certificado? {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        if let cfe = self.certificado {

            var serie: String?
            var fecha: String?
            var importe: String?
            cfe.managedObjectContext?.performAndWait {
                serie = cfe.serieCFE! + " - " + (cfe.numeroCFE?.stringValue)!
                fecha = cfe.fechaCFE?.toString(dateStyle: .short, timeStyle: .none)
                importe = cfe.montoTotalAPagar?.string(with: .currency)
            }
            numberLabel?.text = serie
            dateLabel?.text = fecha
            priceLabel?.text = importe
        }
    }
}
