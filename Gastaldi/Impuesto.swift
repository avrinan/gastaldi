//
//  Impuesto.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/21/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import Foundation
import CoreData
import CFE

class Impuesto: NSManagedObject {

    class func impuestoConImpuestoInfo(_ impInfo: CFE.Impuesto, inManagedObjectContext context: NSManagedObjectContext) -> Impuesto? {
        let request = Impuesto.fetchRequest()
        request.predicate  = NSPredicate(format: "codigo = %@ and monto = %@ and tasa = %@ and valor = %@", impInfo.codigo, impInfo.monto, impInfo.tasa, impInfo.valor)
        
        if let impuesto = (try? context.fetch(request))?.first as? Impuesto {
            return impuesto
        } else if let impuesto = NSEntityDescription.insertNewObject(forEntityName: "Impuesto", into: context) as? Impuesto {
            impuesto.codigo = impInfo.codigo
            impuesto.monto = impInfo.monto as NSNumber?
            impuesto.tasa = impInfo.tasa as NSNumber?
            impuesto.valor = impInfo.valor as NSNumber?
            
            return impuesto
        }
        
        return nil
    }
}
