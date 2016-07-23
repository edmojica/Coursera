//
//  QuesoViewController.swift
//  PizzaApp
//
//  Created by Edson Mojica on 7/22/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController {

    let imagenQuesoMozarela = UIImage.init(named: "mozarela")
    let imagenQuesoCheddar = UIImage.init(named: "cheddar")
    let imagenQuesoParmesano = UIImage.init(named: "parmesano")
    let imagenQuesoSinQueso = UIImage.init(named: "sinQueso")
    
    var miPizza = Pizza()
    var quesoPizza = QuesoPizza()
    
    @IBOutlet weak var nextStep: UIButton!
    @IBOutlet weak var imagenQueso: UIImageView!
    @IBOutlet weak var tipoQuesoSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if quesoPizza == .noQueso {
            imagenQueso.hidden = true
            nextStep.hidden = true
        }
        
    }

    override func viewWillAppear(animated: Bool) {
        tipoQuesoSeg.selectedSegmentIndex = miPizza.queso.rawValue
        quesoPizza = miPizza.queso
        switch quesoPizza {
        case .Mozarela:
            imagenQueso.image = imagenQuesoMozarela
        case .Cheddar:
            imagenQueso.image = imagenQuesoCheddar
        case .Parmesano:
            imagenQueso.image = imagenQuesoParmesano
        default:
            imagenQueso.image = imagenQuesoSinQueso
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func nuevoTipoQueso(sender: UISegmentedControl) {
        if quesoPizza.rawValue != sender.selectedSegmentIndex {
            quesoPizza = QuesoPizza(rawValue:sender.selectedSegmentIndex)!
            imagenQueso.hidden = false
            nextStep.hidden = false
        }
        switch quesoPizza {
        case .Mozarela:
            imagenQueso.image = imagenQuesoMozarela
        case .Cheddar:
            imagenQueso.image = imagenQuesoCheddar
        case .Parmesano:
            imagenQueso.image = imagenQuesoParmesano
        default:
            imagenQueso.image = imagenQuesoSinQueso
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "NextView" {
            miPizza.queso = quesoPizza
            let nextVista = segue.destinationViewController as! IngredientesViewController
            nextVista.miPizza = miPizza
        }
    }
    
    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            // Your code...
            let stack = self.navigationController?.viewControllers.count
            let vista = self.navigationController?.viewControllers[stack! - 1] as! MasaViewController
            miPizza.queso = quesoPizza
            vista.miPizza = miPizza
        }
    }
}
