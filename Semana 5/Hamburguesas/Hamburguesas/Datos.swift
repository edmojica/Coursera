//
//  Datos.swift
//  Hamburguesas
//
//  Created by Edson Mojica on 02/07/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import Foundation
import UIKit

class ColeccionDePaises {
    let paises : [String] = ["México","Francia","Estados Unidos","Argentina","Bolivia","Guatemala","El Salvador","Canada","Portugal","Bélgica","Alemania","Italia","Gales","Islandia","Inglaterra","Colombia","Chile","Holanda","China","Rusia"]
    
    func obtenPais() -> String{
        let posicion = Int (arc4random()) % paises.count
        return paises[posicion]
    }
}

class ColeccionDeHamburguesas {
    let hamburguesas : [String] = ["Guacamole Bacon Burger", "Jalapeño Burger", "Big Chicken Burger", "Mexican Burger", "Tropical Burger", "Whopper Burger", "Big King Burger", "Cheese Burger ", "Spicy Burger", "Sweet Burger", "BBQ Burger", "Crunchy Buger", "Chorizo Burger", "Double Burger", "Fish Burger", "Steak Burger", "Long Rodeo Burger", ]
    
    func obtenHamburguesa () -> String {
        let posicion = Int (arc4random()) % hamburguesas.count
        return hamburguesas[posicion]
    }

}

class ColeccionDeColores {
    let colores = [
        UIColor(red: 30/255, green: 180/255, blue: 20/255, alpha: 1),
        UIColor(red: 50/255, green: 100/255, blue: 50/255, alpha: 1),
        UIColor(red: 70/255, green: 120/255, blue: 70/255, alpha: 1),
        UIColor(red: 80/255, green: 140/255, blue: 90/255, alpha: 1),
        UIColor(red: 90/255, green: 160/255, blue: 100/255, alpha: 1),
        UIColor(red: 100/255, green: 180/255, blue: 120/255, alpha: 1),
        UIColor(red: 120/255, green: 200/255, blue: 130/255, alpha: 1),
        UIColor(red: 150/255, green: 230/255, blue: 150/255, alpha: 1),
        UIColor(red: 170/255, green: 50/255, blue: 200/255, alpha: 1)]
    
    func cambiarColor () -> UIColor {
        let posicion = Int (arc4random()) % colores.count
        return colores[posicion]
    }
}