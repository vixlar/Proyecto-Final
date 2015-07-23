//
//  MenuController.swift
//  SidebarMenu
//
//  Created by Eduardo Iza on 28/06/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit
import CoreData

class MenuController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func borrarTodo(sender: AnyObject) {
        //preguntar si de verdad quiere borrar los datos del teléfono
        let alertController = UIAlertController(title: "iOScreator", message:
            "¿Desea borrar sus datos del teléfono?", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
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
    
    // MARK: - Table view data source


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

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
