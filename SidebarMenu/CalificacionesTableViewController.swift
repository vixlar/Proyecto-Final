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
        //borrar lo que ya exista
        var mDatos: ManejaDatos = ManejaDatos()
        mDatos.borrarTodo()
        
        //actualizar datos
        mDatos.actualizarDatos()
        
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
