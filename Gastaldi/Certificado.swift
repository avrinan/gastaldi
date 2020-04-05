//
//  CFE.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/21/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import Foundation
import CoreData
import CFE

class Certificado: NSManagedObject { 
    
    class func certificadoConCertInfo(_ cfe: CFE.Certificado, inManagedObjectContext context: NSManagedObjectContext) -> Certificado? {
        let request = Certificado.fetchRequest()
        request.predicate = NSPredicate(format: "url = %@", cfe.url)
        
        if let cert = (try? context.fetch(request))?.first as? Certificado {
            return cert
        } else if let cert = NSEntityDescription.insertNewObject(forEntityName: "Certificado", into: context) as? Certificado {
            cert.anioMesCargo = cfe.anioMesCargo as NSNumber?
            cert.clausulaVenta = cfe.clausulaVenta
            cert.codigoSeguridad = cfe.codigoSeguridad
            cert.fechaAlta = cfe.fechaAlta
            cert.fechaCFE = cfe.fechaCFE
            cert.fechaDesde = cfe.fechaDesde
            cert.fechaHasta = cfe.fechaHasta
            cert.fechaVencimiento = cfe.fechaVencimiento
            cert.formaPago = cfe.formaDePago as NSNumber?
            cert.indicadorMB = cfe.indicadorMontosBrutos as NSNumber?
            cert.indicadorTTB = cfe.indicadorTipoTrasladoBienes as NSNumber?
            cert.infoAdicional = cfe.informacionAdicionalComprobante
            cert.lineas = cfe.lineas as NSNumber?
            cert.modalidadVenta = cfe.modalidadVenta as NSNumber?
            cert.montoFacturable = cfe.montoFacturable as NSNumber?
            cert.montoTotalAPagar = cfe.montoTotalAPagar as NSNumber?
            cert.numeroCFE = cfe.numeroCFE as NSNumber?
            cert.serieCFE = cfe.serieCFE
            cert.tasaBasicaIVA = cfe.tasaBasicaIVA as NSNumber?
            cert.tasaMinimaIVA = cfe.tasaMinimaIVA as NSNumber?
            cert.tipoCambio = cfe.tipoCambio as NSNumber?
            cert.tipoCFE = cfe.tipoCFE as NSNumber?
            cert.tipoMoneda = cfe.tipoMonedaTransaccion
            cert.totalCreidtosFiscales = cfe.totalCreditosFiscales as NSNumber?
            cert.totalImpuestoPercibido = cfe.totalImpuestoPercibido as NSNumber?
            cert.totalIVAOtraTasa = cfe.totalIVAOtraTasa as NSNumber?
            cert.totalIVATasaBasica = cfe.totalIVATasaBasica as NSNumber?
            cert.totalIVATasaMinima = cfe.totalIVATasaMinima as NSNumber?
            cert.totalMontoExportacion = cfe.totalMontoExportacionYAsimiladas as NSNumber?
            cert.totalMontoIVAEnSuspenso = cfe.totalMontoIVAEnSuspenso as NSNumber?
            cert.totalMontoNetoIVAOtraTasa = cfe.totalMontoNetoIVAOtraTasa as NSNumber?
            cert.totalMontoNoGravado = cfe.totalMontoNoGravado as NSNumber?
            cert.totalMontoRetenidoPercibido = cfe.totalMontoRetenidoPercibido as NSNumber?
            cert.totalMontoTotal = cfe.totalMontoTotal as NSNumber?
            cert.url = cfe.url
            cert.version = cfe.version
            cert.viaTrasporte = cfe.viaDeTransporte as NSNumber?
            
            
            for itemInfo in cfe.detalleProductosServicios {
                if let it = Item.itemConItemInfo(itemInfo, inManagedObjectContext: context) {
                    cert.mutableSetValue(forKey: "detalleItems").add(it)
                }
            }
            
            for impInfo in cfe.tablaRetencionPercepcionCretidoFiscal {
                if let imp = Impuesto.impuestoConImpuestoInfo(impInfo, inManagedObjectContext: context) {
                    cert.mutableSetValue(forKey: "tablaRetenciones").add(imp)
                }
            }
            
            cert.emisor = Emisor.emisorConEmisorInfo(cfe.emisor, inManagedObjectContext: context)
            cert.receptor = Receptor.receptorConReceptorInfo(cfe.receptor, inManagedObjectContext: context)
        }
        
        return nil
    }
}
