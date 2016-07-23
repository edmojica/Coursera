//
//  ConfirmacionViewController.swift
//  PizzaApp
//
//  Created by Edson Mojica on 7/22/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import UIKit

class ConfirmacionViewController: UIViewController {

    var miPizza = Pizza()

    @IBOutlet weak var tamañoPizza: UILabel!
    @IBOutlet weak var masaPizza: UILabel!
    @IBOutlet weak var quesoPizza: UILabel!
    @IBOutlet weak var ingredientes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(animated: Bool) {
        // Obtener de mi Pizza que ingredientes han sido seleccionados
        tamañoPizza.text = String(miPizza.tamaño)
        masaPizza.text = String(miPizza.masa)
        quesoPizza.text = String(miPizza.queso)
        ingredientes.text = ""
        for ingrediente in miPizza.ingredientes {
            ingredientes.text = ingredientes.text! + String(ingrediente) + " "
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }

}
