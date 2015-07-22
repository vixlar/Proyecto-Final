//
//  CalificacionesTableViewController.swift
//  SidebarMenu
//
//  Created by modelo on 02/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit
import CoreData

class CalificacionesTableViewController: UITableViewController {

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

    @IBAction func actualizarCalificaciones(sender: AnyObject) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Calificaciones", inManagedObjectContext: cntxt)
        
        //borrar lo que ya existía
        var bas: NSManagedObject!
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //crear instancia y poner datos para materia 1
        var newCalificacion = Calificaciones(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newCalificacion.materia = "ANTROPOLOGIA"
        newCalificacion.parcial1 = "92"
        newCalificacion.parcial2 = "100"
        newCalificacion.parcial3 = "82"
        newCalificacion.promedio = "91"
        newCalificacion.ordinario = "91"
        newCalificacion.final = "91"
        cntxt.save(nil)
        
        //crear instancia y poner datos para materia 1
        newCalificacion = Calificaciones(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newCalificacion.materia = "CONTABILIDAD"
        newCalificacion.parcial1 = "79"
        newCalificacion.parcial2 = "88"
        newCalificacion.parcial3 = "76"
        newCalificacion.promedio = "81"
        newCalificacion.ordinario = "27"
        newCalificacion.final = "65"
        cntxt.save(nil)
        
        //crear instancia y poner datos para materia 1
        newCalificacion = Calificaciones(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newCalificacion.materia = "EDUCACION FISICA Y ARTISTICA 6"
        newCalificacion.parcial1 = "A"
        newCalificacion.parcial2 = "A"
        newCalificacion.parcial3 = "A"
        newCalificacion.promedio = "A"
        newCalificacion.ordinario = "A"
        newCalificacion.final = "A"
        cntxt.save(nil)
        
        //recargar la pantalla
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CalificacioinesTableViewCell

        // Configure the cell...
        /*
        if (indexPath.row == 0) {
            cell.lblMateria.text = "ANTROPOLOGIA"
            cell.lblParcial1.text = "92"
            cell.lblParcial2.text = "100"
            cell.lblParcial3.text = "82"
            cell.lblPromedio.text = "91"
            cell.lblOrdinario.text = "91"
            cell.lblFinal.text = "91"
        } else if (indexPath.row == 1) {
            cell.lblMateria.text = "CONTABILIDAD"
            cell.lblParcial1.text = "79"
            cell.lblParcial2.text = "88"
            cell.lblParcial3.text = "76"
            cell.lblPromedio.text = "81"
            cell.lblOrdinario.text = "27"
            cell.lblFinal.text = "65"
        } else {
            cell.lblMateria.text = "EDUCACION FISICA Y ARTISTICA 6"
            cell.lblParcial1.text = "A"
            cell.lblParcial2.text = "A"
            cell.lblParcial3.text = "A"
            cell.lblPromedio.text = "A"
            cell.lblOrdinario.text = "A"
            cell.lblFinal.text = "A"
        }
        */
        var data: NSManagedObject = myList[indexPath.row] as! NSManagedObject
        cell.lblMateria.text = (data.valueForKeyPath("materia") as! String)
        cell.lblParcial1.text = (data.valueForKeyPath("parcial1") as! String)
        cell.lblParcial2.text = (data.valueForKeyPath("parcial2") as! String)
        cell.lblParcial3.text = (data.valueForKeyPath("parcial3") as! String)
        cell.lblPromedio.text = (data.valueForKeyPath("promedio") as! String)
        cell.lblOrdinario.text = (data.valueForKeyPath("ordinario") as! String)
        cell.lblFinal.text = (data.valueForKeyPath("final") as! String)

        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt:NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Calificaciones")
        
        myList = cntxt.executeFetchRequest(freq, error: nil)!
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
