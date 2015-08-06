//
//  ManejaDatos.swift
//  SidebarMenu
//
//  Created by modelo on 23/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import Foundation
import CoreData
import Alamofire

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
        let freqHorarios = NSFetchRequest(entityName: "Horarios")
        
        myList = cntxt.executeFetchRequest(freqHorarios, error: nil)!
        
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
        
        //Actualizar Asignaturas
        Alamofire.request(.POST, "http://www.unimodelo.edu.mx/servicioescolar/appandroid/getasig.php", parameters: ["cve_pago":"10091444"]).responseJSON {
            (_, _, JSON, error) in
            var entity: NSEntityDescription
            let entityAsignaturas = NSEntityDescription.entityForName("Asignaturas", inManagedObjectContext: cntxt)!
            let infoMaterias = JSON as! [NSDictionary]
            var newAsignatura: Asignaturas
            for materia in infoMaterias {
                newAsignatura = Asignaturas(entity:entityAsignaturas, insertIntoManagedObjectContext: cntxt)
                newAsignatura.materia = materia["materia"] as! String
                newAsignatura.maestro = materia["empleado"] as! String
                cntxt.save(nil)
            }
        }
        
        //Actualizar Horarios
        Alamofire.request(.POST, "http://www.unimodelo.edu.mx/servicioescolar/appandroid/gethorario.php", parameters: ["cve_pago":"10091444"]).responseJSON {
            (_, _, JSON, error) in
            //var entity: NSEntityDescription
            let entityHorarios = NSEntityDescription.entityForName("Horarios", inManagedObjectContext: cntxt)!
            let infoHorarios = JSON as! [NSDictionary]
            var newHorario: Horarios
            for horario in infoHorarios {
                newHorario = Horarios(entity:entityHorarios, insertIntoManagedObjectContext: cntxt)
                newHorario.materia = horario["materia"] as! String
                newHorario.lunes = horario["lunes"] as! String
                newHorario.martes = horario["martes"] as! String
                newHorario.miercoles = horario["miercoles"] as! String
                newHorario.jueves = horario["jueves"] as! String
                newHorario.viernes = horario["viernes"] as! String
                newHorario.sabado = horario["sabado"] as! String
                cntxt.save(nil)
            }
        }

        //Actualizar Calificaciones
        Alamofire.request(.POST, "http://www.unimodelo.edu.mx/servicioescolar/appandroid/getcalif.php", parameters: ["cve_pago":"10091444"]).responseJSON {
            (_, _, JSON, error) in
            var entity: NSEntityDescription
            entity = NSEntityDescription.entityForName("Calificaciones", inManagedObjectContext: cntxt)!
            let infoCalificaciones = JSON as! [NSDictionary]
            var newCalificacion: Calificaciones
            for calificacion in infoCalificaciones {
                newCalificacion = Calificaciones(entity:entity, insertIntoManagedObjectContext: cntxt)
                newCalificacion.materia = calificacion["materia"] as! String
                newCalificacion.parcial1 = calificacion["parcial1"] as! String
                newCalificacion.parcial2 = calificacion["parcial2"] as! String
                newCalificacion.parcial3 = calificacion["parcial3"] as! String
                newCalificacion.promedio = calificacion["promedio"] as! String
                newCalificacion.ordinario = calificacion["ordinario"] as! String
                newCalificacion.final = calificacion["califinal"] as! String
                cntxt.save(nil)
            }
        }

        //Actualizar Ordinarios
        Alamofire.request(.POST, "http://www.unimodelo.edu.mx/servicioescolar/appandroid/getord.php", parameters: ["cve_pago":"10091444"]).responseJSON {
            (_, _, JSON, error) in
            var entity: NSEntityDescription
            entity = NSEntityDescription.entityForName("Ordinarios", inManagedObjectContext: cntxt)!
            let infoOrdinarios = JSON as! [NSDictionary]
            var newOrdinario: Ordinarios
            for ordinario in infoOrdinarios {
                newOrdinario = Ordinarios(entity:entity, insertIntoManagedObjectContext: cntxt)
                
                //definir el nombre del maestro
                var maestroPaterno = ordinario["apepat"] as! String
                var maestroMaterno = ordinario["apemat"] as! String
                var maestroNombre = ordinario["nombre"] as! String
                maestroNombre = "\(maestroPaterno) \(maestroMaterno) \(maestroNombre)"
                
                newOrdinario.materia = ordinario["materia"] as! String
                newOrdinario.maestro = maestroNombre
                newOrdinario.fecha = ordinario["fecha"] as! String
                newOrdinario.hora = ordinario["hora"] as! String
                cntxt.save(nil)
            }
        }

        //Actualizar Pagos
        Alamofire.request(.POST, "http://www.unimodelo.edu.mx/servicioescolar/appandroid/getpagos.php", parameters: ["cve_pago":"10091444"]).responseJSON {
            (_, _, JSON, error) in
            var entity: NSEntityDescription
            entity = NSEntityDescription.entityForName("Pagos", inManagedObjectContext: cntxt)!
            let infoPagos = JSON as! [NSDictionary]
            var newPago: Pagos
            //println(infoPagos)
            for pago in infoPagos {
                newPago = Pagos(entity:entity, insertIntoManagedObjectContext: cntxt)
                newPago.descripcion = pago["descripcion"] as! String
                newPago.fecha = pago["fechapago"] as! String
                cntxt.save(nil)
            }
        }
    }
}
