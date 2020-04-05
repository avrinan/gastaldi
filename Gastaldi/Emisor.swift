//
//  Emisor.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/21/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import Foundation
import CoreData
import CFE

class Emisor: NSManagedObject {

    class func emisorConEmisorInfo(_ emi: CFE.Emisor, inManagedObjectContext context:NSManagedObjectContext) -> Emisor? {
        let request = Emisor.fetchRequest()
        request.predicate = NSPredicate(format: "ruc = %d", emi.ruc)
        
        if let em = (try? context.fetch(request))?.first as? Emisor {
            return em
        } else if let em = NSEntityDescription.insertNewObject(forEntityName: "Emisor", into: context) as? Emisor {
            em.ciudad = emi.ciudad
            em.codigoCasaPrincipalSucursal = emi.codigoCasaPrincipalSucursal as NSNumber?
            em.correoElectronico = emi.correoElectronico
            em.denominacion = emi.denominacion
            em.departamento = emi.departamento
            em.domicilioFiscal = emi.domicilioFiscal
            em.giro = emi.giro
            em.infoAdicional = emi.informacionAdicional
            em.nombreCasaPrincipalSucursal = emi.nombreCasaPrincipalSucursal
            em.nombreComercial = emi.nombreComercial
            em.ruc = emi.ruc as NSNumber?
            em.telefono = emi.telefono
            
            return em
        }
        
        return nil
    }
}









