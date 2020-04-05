//
//  Descuento.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/21/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import Foundation
import CoreData
import CFE

class Descuento: NSManagedObject {

    class func descuentoConDesInfo(descInfo: CFE.Descuento, inManagedObjectContext context: NSManagedObjectContext) -> Descuento? {
        let request = Descuento.fetchRequest()
        request.predicate = NSPredicate(format: "tipo = %@ and valor = %@", descInfo.tipo, descInfo.valor)
        
        if let discount = (try? context.fetch(request))?.first as? Descuento {
            return discount
        } else if let discount = NSEntityDescription.insertNewObject(forEntityName: "Descuento", into: context) as? Descuento {
            discount.tipo = descInfo.tipo as NSNumber?
            discount.valor = descInfo.valor as NSNumber?
            
            return discount
        }
        
        return nil
    }
}
