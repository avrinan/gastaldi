//
//  Emisor+CoreDataProperties.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/27/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Emisor {

    @NSManaged var ciudad: String?
    @NSManaged var codigoCasaPrincipalSucursal: NSNumber?
    @NSManaged var correoElectronico: String?
    @NSManaged var denominacion: String?
    @NSManaged var departamento: String?
    @NSManaged var domicilioFiscal: String?
    @NSManaged var giro: String?
    @NSManaged var infoAdicional: String?
    @NSManaged var nombreCasaPrincipalSucursal: String?
    @NSManaged var nombreComercial: String?
    @NSManaged var ruc: NSNumber?
    @NSManaged var telefono: String?
    @NSManaged var cfeEmitidos: NSSet?

}
