//
//  Horarios.swift
//  SidebarMenu
//
//  Created by modelo on 08/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import Foundation
import CoreData

@objc(Horarios)
class Horarios: NSManagedObject {

    @NSManaged var materia: String
    @NSManaged var lunes: String
    @NSManaged var martes: String
    @NSManaged var miercoles: String
    @NSManaged var jueves: String
    @NSManaged var viernes: String
    @NSManaged var sabado: String

}
