//
//  Pagos.swift
//  SidebarMenu
//
//  Created by modelo on 08/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import Foundation
import CoreData

@objc(Pagos)
class Pagos: NSManagedObject {

    @NSManaged var descripcion: String
    @NSManaged var fecha: String

}
