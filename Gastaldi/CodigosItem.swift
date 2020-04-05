//
//  CodigosItem.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/21/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import Foundation
import CoreData
import CFE

class CodigosItem: NSManagedObject {
    
    class func codeItemWithCodeInfo(_ codInfo: CodItem, inManagedObjectContext context: NSManagedObjectContext) -> CodigosItem? {
        let request = CodigosItem.fetchRequest()
        request.predicate = NSPredicate(format: "codigo = %@ and tipo = %@", codInfo.codigo, codInfo.tipo)
        
        if let codItem = (try? context.fetch(request))?.first as? CodigosItem {
            return codItem
        } else if let codigoItem = NSEntityDescription.insertNewObject(forEntityName: "CodigosItem", into: context) as? CodigosItem {
            codigoItem.codigo = codInfo.codigo
            codigoItem.tipo = codInfo.tipo
            
            return codigoItem
        }
        
        return nil
    }
    
}
