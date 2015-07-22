//
//  PagosTableViewController.swift
//  SidebarMenu
//
//  Created by modelo on 02/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit
import CoreData

class PagosTableViewController: UITableViewController {

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

    @IBAction func actualizarPagos(sender: AnyObject) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Pagos", inManagedObjectContext: cntxt)
        
        //borrar lo que ya existía
        var bas: NSManagedObject!
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //crear instancia y poner datos para pago 1
        var newPago = Pagos(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newPago.descripcion = "Pago de Inscripción de Inicio de Curso"
        newPago.fecha = "2014-02-24"
        cntxt.save(nil)
        
        //crear instancia y poner datos para pago 2
        newPago = Pagos(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newPago.descripcion = "Pago del mes de Septiembre"
        newPago.fecha = "2014-09-04"
        cntxt.save(nil)
        
        //crear instancia y poner datos para pago 3
        newPago = Pagos(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newPago.descripcion = "Pago del mes de Octubre"
        newPago.fecha = "2014-10-02"
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PagosTableViewCell

        // Configure the cell...
        /*
        if (indexPath.row == 0) {
            cell.lblConcepto.text = "Pago de Inscripción de Inicio de Curso"
            cell.lblFecha.text = "2014-02-24"
        } else if (indexPath.row == 1) {
            cell.lblConcepto.text = "Pago del mes de Septiembre"
            cell.lblFecha.text = "2014-09-04"
        } else {
            cell.lblConcepto.text = "Pago del mes de Octubre"
            cell.lblFecha.text = "2014-10-02"
        }
        */
        
        var data: NSManagedObject = myList[indexPath.row] as! NSManagedObject
        cell.lblConcepto.text = (data.valueForKeyPath("descripcion") as! String)
        cell.lblFecha.text = (data.valueForKeyPath("fecha") as! String)
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt:NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Pagos")
        
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
