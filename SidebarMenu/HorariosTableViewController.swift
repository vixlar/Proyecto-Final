//
//  HorariosTableViewController.swift
//  SidebarMenu
//
//  Created by modelo on 02/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit
import CoreData

class HorariosTableViewController: UITableViewController {

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
    
    
    @IBAction func actualizarHorarios(sender: AnyObject) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Horarios", inManagedObjectContext: cntxt)
        
        //borrar lo que ya existía
        var bas: NSManagedObject!
        for bas: AnyObject in myList {
            cntxt.deleteObject(bas as! NSManagedObject)
        }
        
        //crear instancia y poner datos para materia 1
        var newHorario = Horarios(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newHorario.materia = "PROB. POLIT. SOC. Y ECON. DEL MEXICO CONTEM"
        newHorario.lunes = "07-08"
        newHorario.martes = "-"
        newHorario.miercoles = "07-08"
        newHorario.jueves = "-"
        newHorario.viernes = "-"
        newHorario.sabado = "-"
        cntxt.save(nil)
        
        //crear instancia y poner datos para materia 2
        newHorario = Horarios(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newHorario.materia = "ANTROPOLOGIA"
        newHorario.lunes = "08-09"
        newHorario.martes = "08-09"
        newHorario.miercoles = "-"
        newHorario.jueves = "12-13"
        newHorario.viernes = "-"
        newHorario.sabado = "-"
        cntxt.save(nil)
        
        //crear instancia y poner datos para materia 3
        newHorario = Horarios(entity:entity!, insertIntoManagedObjectContext: cntxt)
        newHorario.materia = "CONTABILIDAD"
        newHorario.lunes = "09-10"
        newHorario.martes = "-"
        newHorario.miercoles = "09-10"
        newHorario.jueves = "-"
        newHorario.viernes = "09-10"
        newHorario.sabado = "-"
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HorariosTableViewCell

        // Configure the cell...
        /*
        if indexPath.row == 0 {
            cell.lblMateria.text = "PROB. POLIT. SOC. Y ECON. DEL MEXICO CONTEM"
            cell.lblLun.text = "07-08"
            cell.lblMar.text = "-"
            cell.lblMie.text = "07-08"
            cell.lblJue.text = "08-09"
            cell.lblVie.text = "-"
            cell.lblSab.text = "-"
        } else if indexPath.row == 1 {
            cell.lblMateria.text = "ANTROPOLOGIA"
            cell.lblLun.text = "08-09"
            cell.lblMar.text = "08-09"
            cell.lblMie.text = "-"
            cell.lblJue.text = "12-13"
            cell.lblVie.text = "-"
            cell.lblSab.text = "-"
        } else {
            cell.lblMateria.text = "CONTABILIDAD"
            cell.lblLun.text = "09-10"
            cell.lblMar.text = "-"
            cell.lblMie.text = "09-10"
            cell.lblJue.text = "-"
            cell.lblVie.text = "09-10"
            cell.lblSab.text = "-"
        }
        */
        
        var data: NSManagedObject = myList[indexPath.row] as! NSManagedObject
        cell.lblMateria.text = (data.valueForKeyPath("materia") as! String)
        cell.lblLun.text = (data.valueForKeyPath("lunes") as! String)
        cell.lblMar.text = (data.valueForKeyPath("martes") as! String)
        cell.lblMie.text = (data.valueForKeyPath("miercoles") as! String)
        cell.lblJue.text = (data.valueForKeyPath("jueves") as! String)
        cell.lblVie.text = (data.valueForKeyPath("viernes") as! String)
        cell.lblSab.text = (data.valueForKeyPath("sabado") as! String)

        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        //referencia al delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //referencia al modelo
        let cntxt:NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Horarios")
        
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
