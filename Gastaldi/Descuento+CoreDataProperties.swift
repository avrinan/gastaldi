//
//  Descuento+CoreDataProperties.swift
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

extension Descuento {

    @NSManaged var tipo: NSNumber?
    @NSManaged var valor: NSNumber?

}
