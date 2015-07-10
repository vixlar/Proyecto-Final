//
//  Ordinarios.swift
//  SidebarMenu
//
//  Created by modelo on 08/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import Foundation
import CoreData

@objc(Ordinarios)
class Ordinarios: NSManagedObject {

    @NSManaged var materia: String
    @NSManaged var maestro: String
    @NSManaged var fecha: String
    @NSManaged var hora: String

}
