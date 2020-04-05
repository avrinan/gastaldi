//
//  Recargo.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/21/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import Foundation
import CoreData
import CFE

class Recargo: NSManagedObject {

    class func recargoConRecargoInfo(_ recInfo: CFE.Recargo, inManagedObjectContext context: NSManagedObjectContext) -> Recargo? {
        let request = Recargo.fetchRequest()
        request.predicate = NSPredicate(format: "tipo = %@ and valor = %@", recInfo.tipo, recInfo.valor)
        
        if let recargo = (try? context.fetch(request))?.first as? Recargo {
            return recargo
        } else if let recargo = NSEntityDescription.insertNewObject(forEntityName: "Recargo", into: context) as? Recargo {
            recargo.tipo = recInfo.tipo as NSNumber?
            recargo.valor = recInfo.valor as NSNumber?
            
            return recargo
        }
        
        return nil
    }
}
