//
//  SizeViewController.swift
//  PizzaApp
//
//  Created by Edson Mojica on 7/22/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import UIKit


class SizeViewController: UIViewController {

    let imagenPizzaChica = UIImage.init(named: "pizzaChica")
    let imagenPizzaMedina = UIImage.init(named: "pizzaMediana")
    let imagenPizzaGrande = UIImage.init(named: "sizePizza")
    
    var miPizza = Pizza()
    var tamañoPizza = TamañoPizza.noTamaño
    
    @IBOutlet weak var nextStepButton: UIButton!
    @IBOutlet weak var imagenPizza: UIImageView!
    @IBOutlet weak var sizePizzaSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        
        if tamañoPizza == .noTamaño {
            imagenPizza.hidden = true
            nextStepButton.hidden = true
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        sizePizzaSeg.selectedSegmentIndex = miPizza.tamaño.rawValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nuevoTamaño(sender: UISegmentedControl) {
        if tamañoPizza.rawValue != sender.selectedSegmentIndex {
            tamañoPizza = TamañoPizza(rawValue: sender.selectedSegmentIndex)!
            imagenPizza.hidden = false
            nextStepButton.hidden = false
        }
        switch tamañoPizza {
        case .Chica:
            imagenPizza.image = imagenPizzaChica
        case .Mediana:
            imagenPizza.image = imagenPizzaMedina
        default:
            imagenPizza.image = imagenPizzaGrande
        }
    }
    
    @IBAction func nextStep(sender: AnyObject) {
        /*if sizePizzaSeg.selectedSegmentIndex == TamañoPizza.noTamaño.rawValue {
            let alertController = UIAlertController(title: "PizzaApp", message: "Se debe seleccionar un tamaño de pizza", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alertController.addAction(OKAction)
            self.presentingViewController(alertController!, animated: true) {
                
            }
        }
        */
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        miPizza.tamaño = tamañoPizza
        let nextVista = segue.destinationViewController as! MasaViewController
        nextVista.miPizza = miPizza
    }

}
