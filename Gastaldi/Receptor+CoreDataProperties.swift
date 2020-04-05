//
//  Receptor+CoreDataProperties.swift
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

extension Receptor {

    @NSManaged var ciudad: String?
    @NSManaged var codigoPais: String?
    @NSManaged var codigoPostal: NSNumber?
    @NSManaged var codigoTIpoDocumento: NSNumber?
    @NSManaged var denominacion: String?
    @NSManaged var deptoProvinciaEstado: String?
    @NSManaged var direccion: String?
    @NSManaged var infoAdicional: String?
    @NSManaged var lugarDestinoEntrega: String?
    @NSManaged var numeroDocumentoExtranjero: String?
    @NSManaged var numeroDocumentoUruguayo: String?
    @NSManaged var numeroIdentificacionCompra: String?
    @NSManaged var pais: String?
    @NSManaged var cfeRecibidos: NSSet?

}
