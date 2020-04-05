//
//  Certificado+CoreDataProperties.swift
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

extension Certificado {

    @NSManaged var anioMesCargo: NSNumber?
    @NSManaged var clausulaVenta: String?
    @NSManaged var fechaAlta: Date?
    @NSManaged var fechaCFE: Date?
    @NSManaged var fechaDesde: Date?
    @NSManaged var fechaHasta: Date?
    @NSManaged var fechaVencimiento: Date?
    @NSManaged var formaPago: NSNumber?
    @NSManaged var indicadorMB: NSNumber?
    @NSManaged var indicadorTTB: NSNumber?
    @NSManaged var infoAdicional: String?
    @NSManaged var lineas: NSNumber?
    @NSManaged var modalidadVenta: NSNumber?
    @NSManaged var montoFacturable: NSNumber?
    @NSManaged var montoTotalAPagar: NSNumber?
    @NSManaged var numeroCFE: NSNumber?
    @NSManaged var serieCFE: String?
    @NSManaged var tasaBasicaIVA: NSNumber?
    @NSManaged var tasaMinimaIVA: NSNumber?
    @NSManaged var tipoCambio: NSNumber?
    @NSManaged var tipoCFE: NSNumber?
    @NSManaged var tipoMoneda: String?
    @NSManaged var totalCreidtosFiscales: NSNumber?
    @NSManaged var totalImpuestoPercibido: NSNumber?
    @NSManaged var totalIVAOtraTasa: NSNumber?
    @NSManaged var totalIVATasaBasica: NSNumber?
    @NSManaged var totalIVATasaMinima: NSNumber?
    @NSManaged var totalMontoExportacion: NSNumber?
    @NSManaged var totalMontoIVAEnSuspenso: NSNumber?
    @NSManaged var totalMontoNetoIVAOtraTasa: NSNumber?
    @NSManaged var totalMontoNoGravado: NSNumber?
    @NSManaged var totalMontoRetenidoPercibido: NSNumber?
    @NSManaged var totalMontoTotal: NSNumber?
    @NSManaged var url: String?
    @NSManaged var version: String?
    @NSManaged var viaTrasporte: NSNumber?
    @NSManaged var codigoSeguridad: String?
    @NSManaged var detalleItems: NSSet?
    @NSManaged var emisor: Emisor?
    @NSManaged var receptor: Receptor?
    @NSManaged var tablaRetenciones: NSSet?

}
