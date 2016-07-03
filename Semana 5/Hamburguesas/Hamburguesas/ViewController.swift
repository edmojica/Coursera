//
//  ViewController.swift
//  Hamburguesas
//
//  Created by Edson Mojica on 02/07/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nombreDePais: UILabel!
    @IBOutlet weak var nombreDeHamburguesa: UILabel!
    
    let coleccionDePaises  = ColeccionDePaises()
    let coleccionDeHamburguesas = ColeccionDeHamburguesas()
    let coleccionDeColores = ColeccionDeColores()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cambiaPaisHamburguesa() {
        nombreDePais.text = coleccionDePaises.obtenPais()
        nombreDeHamburguesa.text = coleccionDeHamburguesas.obtenHamburguesa()
        let colorAleatorio = coleccionDeColores.cambiarColor()
        view.backgroundColor = colorAleatorio
        view.tintColor = colorAleatorio
    }

}

