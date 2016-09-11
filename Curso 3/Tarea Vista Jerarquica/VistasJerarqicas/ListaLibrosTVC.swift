//
//  ListaLibrosTVC.swift
//  VistasJerarqicas
//
//  Created by Edson Mojica on 10/9/16.
//  Copyright © 2016 edmojica. All rights reserved.
//




import UIKit
import CoreData

class ListaLibrosTVC: UITableViewController {
    
    
    @IBOutlet weak var vistaLibros: UITableView!
    var libros : [[String]] = [[String]]()
    var contexto : NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lista de Libros"
        self.vistaLibros.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .Plain, target: self, action: "buscarPorISBN")
        
        
        self.contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        obtenerDatos()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.libros.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.libros[indexPath.row][0]
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let lvc = segue.destinationViewController as! LibroVC
        lvc.cIsbn = nil
        if let ip = self.vistaLibros.indexPathForSelectedRow {
            lvc.cIsbn = self.libros[ip.row][1]
            print("isbn seleccionado: \(lvc.cIsbn)")
        }
    }

    
    func buscarPorISBN() {
        performSegueWithIdentifier("obtenerLibro", sender: self)
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        self.libros.removeAll()
        obtenerDatos()
        self.vistaLibros.reloadData()
    }
    
    func obtenerDatos () {
        let entidadLibro = NSEntityDescription.entityForName("Libro", inManagedObjectContext: self.contexto!)
        let consultaLibros = entidadLibro?.managedObjectModel.fetchRequestTemplateForName("Libros")
        
        do {
            let consultaRecuperada = try self.contexto.executeFetchRequest(consultaLibros!)
            if (consultaRecuperada.count > 0) {
                for (var i = 0 ; i < consultaRecuperada.count ; i+1){
                    let titulo = consultaRecuperada[i].valueForKey("titulol") as! String
                    let isbn = consultaRecuperada[i].valueForKey("isbnl") as! String
                    self.libros.append([titulo, isbn])
                }
            }
        }catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            
        }
    }
}
