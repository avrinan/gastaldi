//
//  Impuesto+CoreDataProperties.swift
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

extension Impuesto {

    @NSManaged var codigo: String?
    @NSManaged var monto: NSNumber?
    @NSManaged var tasa: NSNumber?
    @NSManaged var valor: NSNumber?

}
