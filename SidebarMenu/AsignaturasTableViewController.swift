//
//  AsignaturasTableViewController.swift
//  SidebarMenu
//
//  Created by modelo on 02/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit
import CoreData

class AsignaturasTableViewController: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    var myList: Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func actualizarAsignaturas(sender: AnyObject) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt:NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Asignaturas", inManagedObjectContext: cntxt)
        
        //borrar lo que ya exista
        var bas: NSManagedObject!
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //crear instancia de los datos e inicializar
        var newAsignatura = Asignaturas(entity:entity!, insertIntoManagedObjectContext: cntxt)
        
        //mapear propiedades
        newAsignatura.materia = "PROB. POLIT SOC. Y ECON. DEL MEXICO CONTEM"
        newAsignatura.maestro = "MARIA JOSE MEDINA"
        
        //grabar contexto
        cntxt.save(nil)
        
        newAsignatura = Asignaturas(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newAsignatura.materia = "ANTROPOLOGIA"
        newAsignatura.maestro = "OLGA ALICIA CHAVEZ"
        cntxt.save(nil)
        
        newAsignatura = Asignaturas(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newAsignatura.materia = "LITERATURA MEXICANA"
        newAsignatura.maestro = "CARLOS EDUARDO GONZALEZ GOMEZ"
        cntxt.save(nil)
        
        //imprimir prueba
        //println(newAsignatura)
        
        self.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AsinaturasTableViewCell

        // Configure the cell...
//        if indexPath.row == 0 {
//            cell.lblMateria.text = "PROB. POLIT SOC. Y ECON. DEL MEXICO CONTEM"
//            cell.lblMaestro.text = "MARIA JOSE MEDINA"
//        } else if indexPath.row == 1 {
//            cell.lblMateria.text = "ANTROPOLOGIA"
//            cell.lblMaestro.text = "OLGA ALICIA CHAVEZ"
//        } else {
//            cell.lblMateria.text = "LITERATURA MEXICANA"
//            cell.lblMaestro.text = "CARLOS EDUARDO GONZALEZ GOMEZ"
//        }
        var data: NSManagedObject = myList[indexPath.row] as! NSManagedObject
        cell.lblMateria.text = (data.valueForKeyPath("materia") as! String)
        cell.lblMaestro.text = (data.valueForKeyPath("maestro") as! String)
        
        
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt:NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Asignaturas")
        
        myList = cntxt.executeFetchRequest(freq, error: nil)!
        tableView.reloadData()
    }
    
}
