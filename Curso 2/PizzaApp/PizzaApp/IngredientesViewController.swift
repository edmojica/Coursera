//
//  IngredientesViewController.swift
//  PizzaApp
//
//  Created by Edson Mojica on 7/22/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController {

    var miPizza = Pizza()
    var ingredientes : [Int] = []
    
    @IBOutlet weak var swJamon: UISwitch!
    @IBOutlet weak var swPepperoni: UISwitch!
    @IBOutlet weak var swPavo: UISwitch!
    @IBOutlet weak var swSalchica: UISwitch!
    @IBOutlet weak var swAceituna: UISwitch!
    @IBOutlet weak var swCebolla: UISwitch!
    @IBOutlet weak var swPimiento: UISwitch!
    @IBOutlet weak var swPiña: UISwitch!
    @IBOutlet weak var swAnchoa: UISwitch!
    
    @IBOutlet weak var nextStep: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if ingredientes.count < 1 {
            nextStep.hidden = true
        }
        swJamon.tag = IngredientesPizza.Jamón.rawValue
        swPepperoni.tag = IngredientesPizza.Pepperoni.rawValue
        swPavo.tag = IngredientesPizza.Pavo.rawValue
        swSalchica.tag = IngredientesPizza.Salchicha.rawValue
        swAceituna.tag = IngredientesPizza.Aceituna.rawValue
        swCebolla.tag = IngredientesPizza.Cebolla.rawValue
        swPimiento.tag = IngredientesPizza.Pimineto.rawValue
        swPiña.tag = IngredientesPizza.Piña.rawValue
        swAnchoa.tag = IngredientesPizza.Anchoa.rawValue
    }

    override func viewWillAppear(animated: Bool) {
        // Obtener de mi Pizza que ingredientes han sido seleccionados
        ingredientes.removeAll()
        for ingrediente in miPizza.ingredientes {
            switch ingrediente {
            case .Anchoa:
                swAnchoa.on = true
            case .Aceituna:
                swAceituna.on = true
            case .Cebolla:
                swCebolla.on = true
            case .Jamón:
                swJamon.on = true
            case .Pavo:
                swPavo.on = true
            case .Pepperoni:
                swPepperoni.on = true
            case .Pimineto:
                swPimiento.on = true
            case .Piña:
                swPiña.on = true
            case .Salchicha:
                swSalchica.on = true
            }
            ingredientes.append(ingrediente.rawValue)
        }
        if ingredientes.count < 1 {
            nextStep.hidden = true
        } else {
            nextStep.hidden = false
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changeState(sender: UISwitch) {
        if sender.on {
            if !ingredientes.contains(sender.tag) {
                ingredientes.append(sender.tag)
                _ = IngredientesPizza(rawValue: sender.tag)!
            }
        }
        else {
            if ingredientes.contains(sender.tag) {
            ingredientes.removeAtIndex( ingredientes.indexOf(sender.tag)!)
            }
        }
        if ingredientes.count < 1 {
            nextStep.hidden = true
        } else {
            nextStep.hidden = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            asignaIngredientes()
            let nextVista = segue.destinationViewController as! ConfirmacionViewController
            nextVista.miPizza = miPizza
    }
    
    func asignaIngredientes() {
        miPizza.ingredientes.removeAll()
        for ingrediente in ingredientes {
            miPizza.ingredientes.append(IngredientesPizza(rawValue: ingrediente)!)
        }
    }
    
    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            // Your code...
            let stack = self.navigationController?.viewControllers.count
            let vista = self.navigationController?.viewControllers[stack! - 1] as! QuesoViewController
            asignaIngredientes()
            vista.miPizza = miPizza
        }
    }
    
}
