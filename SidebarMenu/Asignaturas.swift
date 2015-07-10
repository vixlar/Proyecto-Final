//
//  Asignaturas.swift
//  SidebarMenu
//
//  Created by modelo on 08/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import Foundation
import CoreData

@objc (Asignaturas)
class Asignaturas: NSManagedObject {

    @NSManaged var materia: String
    @NSManaged var maestro: String

}
