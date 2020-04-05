//
//  Item+CoreDataProperties.swift
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

extension Item {

    @NSManaged var cantidad: NSNumber?
    @NSManaged var descripcion: String?
    @NSManaged var descuento: NSNumber?
    @NSManaged var indicadorAgenteResponsable: String?
    @NSManaged var indicadorFacturacion: NSNumber?
    @NSManaged var monto: NSNumber?
    @NSManaged var montoDescuento: NSNumber?
    @NSManaged var montoRecargo: NSNumber?
    @NSManaged var nombre: String?
    @NSManaged var nroSecuencial: NSNumber?
    @NSManaged var precioUnitario: NSNumber?
    @NSManaged var recargo: NSNumber?
    @NSManaged var unidadMedida: String?
    @NSManaged var tablaCodigos: NSSet?
    @NSManaged var tablaDistribucionDesc: NSSet?
    @NSManaged var tablaDistribucionRecargo: NSSet?
    @NSManaged var tablaImpuestos: NSSet?

}
