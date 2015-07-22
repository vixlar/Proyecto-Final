//
//  OrdinariosTableViewController.swift
//  SidebarMenu
//
//  Created by modelo on 02/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit
import CoreData

class OrdinariosTableViewController: UITableViewController {

    @IBOutlet var menuButton: UIBarButtonItem!
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

    @IBAction func actualizarOrdinarios(sender: AnyObject) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Ordinarios", inManagedObjectContext: cntxt)
        
        //borrar lo que ya existía
        var bas: NSManagedObject!
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //crear instancia y poner datos para ordinario 1
        var newOrdinario = Ordinarios(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newOrdinario.materia = "PROB. POLIT. SOC. Y ECON. DEL MEXICO CONTEMP."
        newOrdinario.maestro = "MEDINA ANCONA MARIA JOSE"
        newOrdinario.fecha = "2015-05-26"
        newOrdinario.hora = "07:00"
        cntxt.save(nil)
        
        //crear instancia y poner datos para ordinario 2
        newOrdinario = Ordinarios(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newOrdinario.materia = "ANTROPOLOGIA"
        newOrdinario.maestro = "GIUSTINIANOVIC CHAVEZ OLGA ALICIA"
        newOrdinario.fecha = "2015-05-28"
        newOrdinario.hora = "07:00"
        cntxt.save(nil)
        
        //crear instancia y poner datos para ordinario 3
        newOrdinario = Ordinarios(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newOrdinario.materia = "LITERATURA MEXICANA"
        newOrdinario.maestro = "GONZALEZ GOMEZ CARLOS EDUARDO"
        newOrdinario.fecha = "2015-01-19"
        newOrdinario.hora = "08:00"
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! OrdinariosTableViewCell

        // Configure the cell...
        /*
        if (indexPath.row == 0) {
            cell.lblMateria.text = "PROB. POLIT. SOC. Y ECON. DEL MEXICO CONTEMP."
            cell.lblProfesor.text = "MEDINA ANCONA MARIA JOSE"
            cell.lblFecha.text = "2015-05-26"
            cell.lblHora.text = "07:00"
        } else if (indexPath.row == 1) {
            cell.lblMateria.text = "ANTROPOLOGIA"
            cell.lblProfesor.text = "GIUSTINIANOVIC CHAVEZ OLGA ALICIA"
            cell.lblFecha.text = "2015-05-28"
            cell.lblHora.text = "07:00"
        } else {
            cell.lblMateria.text = "LITERATURA MEXICANA"
            cell.lblProfesor.text = "GONZALEZ GOMEZ CARLOS EDUARDO"
            cell.lblFecha.text = "2015-01-19"
            cell.lblHora.text = "08:00"
        }
        */
        
        var data: NSManagedObject = myList[indexPath.row] as! NSManagedObject
        cell.lblMateria.text = (data.valueForKeyPath("materia") as! String)
        cell.lblProfesor.text = (data.valueForKeyPath("maestro") as! String)
        cell.lblFecha.text = (data.valueForKeyPath("fecha") as! String)
        cell.lblHora.text = (data.valueForKeyPath("hora") as! String)
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt:NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Ordinarios")
        
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
