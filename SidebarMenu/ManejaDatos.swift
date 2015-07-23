//
//  ManejaDatos.swift
//  SidebarMenu
//
//  Created by modelo on 23/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import Foundation
import CoreData

class ManejaDatos {
    func borrarTodo () {
        
        var myList: Array<AnyObject> = []
        
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var bas: NSManagedObject!
        
        //referencia al modelo
        let cntxt:NSManagedObjectContext = appDel.managedObjectContext!
        
        //borrar Asignaturas
        var freq = NSFetchRequest(entityName: "Asignaturas")
        
        myList = cntxt.executeFetchRequest(freq, error: nil)!
        
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //borrar Horarios
        freq = NSFetchRequest(entityName: "Horarios")
        
        myList = cntxt.executeFetchRequest(freq, error: nil)!
        
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //borrar Calificaciones
        freq = NSFetchRequest(entityName: "Calificaciones")
        
        myList = cntxt.executeFetchRequest(freq, error: nil)!
        
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //borrar Ordinarios
        freq = NSFetchRequest(entityName: "Ordinarios")
        
        myList = cntxt.executeFetchRequest(freq, error: nil)!
        
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //borrar Pagos
        freq = NSFetchRequest(entityName: "Pagos")
        
        myList = cntxt.executeFetchRequest(freq, error: nil)!
        
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
    }
    
    func actualizarDatos () {
        //referencia al delegate y al contexto
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let cntxt : NSManagedObjectContext = appDel.managedObjectContext!
        var entity: NSEntityDescription
        
        //actualizar Asignaturas
        entity = NSEntityDescription.entityForName("Asignaturas", inManagedObjectContext: cntxt)!
        var newAsignatura: Asignaturas
        
        //llenar datos
        newAsignatura = Asignaturas(entity:entity, insertIntoManagedObjectContext: cntxt)
        newAsignatura.materia = "PROB. POLIT SOC. Y ECON. DEL MEXICO CONTEM"
        newAsignatura.maestro = "MARIA JOSE MEDINA"
        cntxt.save(nil)
        
        newAsignatura = Asignaturas(entity:entity, insertIntoManagedObjectContext: cntxt)
        newAsignatura.materia = "ANTROPOLOGIA"
        newAsignatura.maestro = "OLGA ALICIA CHAVEZ"
        cntxt.save(nil)

        newAsignatura = Asignaturas(entity:entity, insertIntoManagedObjectContext: cntxt)
        newAsignatura.materia = "LITERATURA MEXICANA"
        newAsignatura.maestro = "CARLOS EDUARDO GONZALEZ GOMEZ"
        cntxt.save(nil)
        
        //Actualizar Horarios
        entity = NSEntityDescription.entityForName("Horarios", inManagedObjectContext: cntxt)!
        var newHorario: Horarios
        
        //llenar datos
        newHorario = Horarios(entity:entity, insertIntoManagedObjectContext: cntxt)
        newHorario.materia = "PROB. POLIT. SOC. Y ECON. DEL MEXICO CONTEM"
        newHorario.lunes = "07-08"
        newHorario.martes = "-"
        newHorario.miercoles = "07-08"
        newHorario.jueves = "-"
        newHorario.viernes = "-"
        newHorario.sabado = "-"
        cntxt.save(nil)
        
        newHorario = Horarios(entity:entity, insertIntoManagedObjectContext: cntxt)
        newHorario.materia = "ANTROPOLOGIA"
        newHorario.lunes = "08-09"
        newHorario.martes = "08-09"
        newHorario.miercoles = "-"
        newHorario.jueves = "12-13"
        newHorario.viernes = "-"
        newHorario.sabado = "-"
        cntxt.save(nil)
        
        newHorario = Horarios(entity:entity, insertIntoManagedObjectContext: cntxt)
        newHorario.materia = "CONTABILIDAD"
        newHorario.lunes = "09-10"
        newHorario.martes = "-"
        newHorario.miercoles = "09-10"
        newHorario.jueves = "-"
        newHorario.viernes = "09-10"
        newHorario.sabado = "-"
        cntxt.save(nil)
        
        //Actualizar Calificaciones
        entity = NSEntityDescription.entityForName("Calificaciones", inManagedObjectContext: cntxt)!
        var newCalificacion: Calificaciones
        
        //lenar datos
        newCalificacion = Calificaciones(entity:entity, insertIntoManagedObjectContext: cntxt)
        newCalificacion.materia = "ANTROPOLOGIA"
        newCalificacion.parcial1 = "92"
        newCalificacion.parcial2 = "100"
        newCalificacion.parcial3 = "82"
        newCalificacion.promedio = "91"
        newCalificacion.ordinario = "91"
        newCalificacion.final = "91"
        cntxt.save(nil)
        
        newCalificacion = Calificaciones(entity:entity, insertIntoManagedObjectContext: cntxt)
        newCalificacion.materia = "CONTABILIDAD"
        newCalificacion.parcial1 = "79"
        newCalificacion.parcial2 = "88"
        newCalificacion.parcial3 = "76"
        newCalificacion.promedio = "81"
        newCalificacion.ordinario = "27"
        newCalificacion.final = "65"
        cntxt.save(nil)
        
        newCalificacion = Calificaciones(entity:entity, insertIntoManagedObjectContext: cntxt)
        newCalificacion.materia = "EDUCACION FISICA Y ARTISTICA 6"
        newCalificacion.parcial1 = "A"
        newCalificacion.parcial2 = "A"
        newCalificacion.parcial3 = "A"
        newCalificacion.promedio = "A"
        newCalificacion.ordinario = "A"
        newCalificacion.final = "A"
        cntxt.save(nil)
        
        //Actualizar Ordinarios
        entity = NSEntityDescription.entityForName("Ordinarios", inManagedObjectContext: cntxt)!
        var newOrdinario: Ordinarios
        
        //llenar datos
        newOrdinario = Ordinarios(entity:entity, insertIntoManagedObjectContext: cntxt)
        newOrdinario.materia = "PROB. POLIT. SOC. Y ECON. DEL MEXICO CONTEMP."
        newOrdinario.maestro = "MEDINA ANCONA MARIA JOSE"
        newOrdinario.fecha = "2015-05-26"
        newOrdinario.hora = "07:00"
        cntxt.save(nil)
        
        newOrdinario = Ordinarios(entity:entity, insertIntoManagedObjectContext: cntxt)
        newOrdinario.materia = "ANTROPOLOGIA"
        newOrdinario.maestro = "GIUSTINIANOVIC CHAVEZ OLGA ALICIA"
        newOrdinario.fecha = "2015-05-28"
        newOrdinario.hora = "07:00"
        cntxt.save(nil)
        
        newOrdinario = Ordinarios(entity:entity, insertIntoManagedObjectContext: cntxt)
        newOrdinario.materia = "LITERATURA MEXICANA"
        newOrdinario.maestro = "GONZALEZ GOMEZ CARLOS EDUARDO"
        newOrdinario.fecha = "2015-01-19"
        newOrdinario.hora = "08:00"
        cntxt.save(nil)
        
        //Actualizar pagos
        entity = NSEntityDescription.entityForName("Pagos", inManagedObjectContext: cntxt)!
        var newPago: Pagos
        
        //llenar datos
        newPago = Pagos(entity:entity, insertIntoManagedObjectContext: cntxt)
        newPago.descripcion = "Pago de Inscripción de Inicio de Curso"
        newPago.fecha = "2014-02-24"
        cntxt.save(nil)
        
        newPago = Pagos(entity:entity, insertIntoManagedObjectContext: cntxt)
        newPago.descripcion = "Pago del mes de Septiembre"
        newPago.fecha = "2014-09-04"
        cntxt.save(nil)
        
        newPago = Pagos(entity:entity, insertIntoManagedObjectContext: cntxt)
        newPago.descripcion = "Pago del mes de Octubre"
        newPago.fecha = "2014-10-02"
        cntxt.save(nil)
    }
}
