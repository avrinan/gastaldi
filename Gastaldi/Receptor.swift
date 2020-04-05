//
//  Receptor.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/21/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import Foundation
import CoreData
import CFE

class Receptor: NSManagedObject {

    class func receptorConReceptorInfo(_ rec: CFE.Receptor, inManagedObjectContext context:NSManagedObjectContext) -> Receptor? {
        let request = Receptor.fetchRequest()
        request.predicate = NSPredicate(format: "codigoPais = %@ and codigoTIpoDocumento = %d and numeroDocumentoUruguayo = %@", rec.codigoPais, rec.codigoTipoDocumento, rec.numeroDocumentoUruguayo)
        
        if let recp = (try? context.fetch(request))?.first as? Receptor {
            return recp
        } else if let recp = NSEntityDescription.insertNewObject(forEntityName: "Receptor", into: context) as? Receptor {
            recp.ciudad = rec.ciudad
            recp.codigoPais = rec.codigoPais
            recp.codigoPostal = rec.codigoPostal as NSNumber?
            recp.codigoTIpoDocumento = rec.codigoTipoDocumento as NSNumber?
            recp.denominacion = rec.denominacion
            recp.deptoProvinciaEstado = rec.deptoProvinciaEstado
            recp.direccion = rec.direccion
            recp.infoAdicional = rec.informacionAdicional
            recp.lugarDestinoEntrega = rec.lugarDestinoEntrega
            recp.numeroDocumentoExtranjero = rec.numeroDocumentoExtranjero
            recp.numeroDocumentoUruguayo = rec.numeroDocumentoUruguayo
            recp.numeroIdentificacionCompra = rec.numeroIdentificacionCompra
            recp.pais = rec.pais
            
            return recp
        }
        
        return nil
    }
}
