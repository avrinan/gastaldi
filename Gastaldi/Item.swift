//
//  Item.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 8/21/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import Foundation
import CoreData
import CFE

class Item: NSManagedObject {
    
    class func itemConItemInfo(_ itemInfo: CFE.Item, inManagedObjectContext context: NSManagedObjectContext) -> Item? {
        let request = Item.fetchRequest()
        request.predicate = NSPredicate(format: "nombre = %@", itemInfo.nombreDelItem)
        
        if let item = (try? context.fetch(request))?.first as? Item {
            return item
        } else if let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context) as? Item {
            item.cantidad = itemInfo.cantidad as NSNumber?
            item.descripcion = itemInfo.descripcionAdicional
            item.descuento = itemInfo.descuento as NSNumber?
            item.indicadorAgenteResponsable = itemInfo.indicadorAgenteResponsable
            item.indicadorFacturacion = itemInfo.indicadorDeFacturacion as NSNumber?
            item.monto = itemInfo.monto as NSNumber?
            item.montoDescuento = itemInfo.montoDescuento as NSNumber?
            item.montoRecargo = itemInfo.montoRecargo as NSNumber?
            item.nombre = itemInfo.nombreDelItem
            item.nroSecuencial = itemInfo.nroSecuencial as NSNumber?
            item.precioUnitario = itemInfo.precioUnitario as NSNumber?
            item.recargo = itemInfo.recargo as NSNumber?
            item.unidadMedida = itemInfo.unidadDeMedida
            
            item.tablaCodigos = NSSet()
            item.tablaDistribucionDesc = NSSet()
            item.tablaDistribucionRecargo = NSSet()
            item.tablaImpuestos = NSSet()
            
            for codigo in itemInfo.tablaDeCodigosDelItem {
                if let ci = CodigosItem.codeItemWithCodeInfo(codigo, inManagedObjectContext: context) {
                    item.mutableSetValue(forKey: "tablaCodigos").add(ci)
                }
            }
            
            for descuento in itemInfo.tablaDeDistribucionDelDescuento {
                if let dd = Descuento.descuentoConDesInfo(descInfo: descuento, inManagedObjectContext: context) {
                    item.mutableSetValue(forKey: "tablaDistribucionDesc").add(dd)
                }
            }
            
            for recInfo in itemInfo.tablaDeDistribucionDelRecargo {
                if let dr = Recargo.recargoConRecargoInfo(recInfo, inManagedObjectContext: context) {
                    item.mutableSetValue(forKey: "tablaDistribucionRecargo").add(dr)
                }
            }
            
            for impuesto in itemInfo.tablaDeRetencionesPercepciones {
                if let imp = Impuesto.impuestoConImpuestoInfo(impuesto, inManagedObjectContext: context) {
                    item.mutableSetValue(forKey: "tablaImpuestos").add(imp)
                }
            }
            
            return item
        }
        
        return nil
    }

}
