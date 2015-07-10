//
//  Calificaciones.swift
//  SidebarMenu
//
//  Created by modelo on 08/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import Foundation
import CoreData

@objc(Calificaciones)
class Calificaciones: NSManagedObject {

    @NSManaged var materia: String
    @NSManaged var parcial1: String
    @NSManaged var parcial2: String
    @NSManaged var parcial3: String
    @NSManaged var promedio: String
    @NSManaged var ordinario: String
    @NSManaged var final: String

}
