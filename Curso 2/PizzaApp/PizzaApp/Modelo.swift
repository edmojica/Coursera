//
//  Modelo.swift
//  PizzaApp
//
//  Created by Edson Mojica on 7/22/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import Foundation
import UIKit

enum TamañoPizza : Int {
    case noTamaño = -1, Chica, Mediana, Grande
    
    init() {
        self = .noTamaño
    }
}

enum MasaPizza : Int {
    case noMasa = -1, Delgada, Crujiente, Gruesa
    
    init(){
        self = .noMasa
    }
}

enum QuesoPizza : Int {
    case noQueso = -1, Mozarela, Cheddar, Parmesano, SinQueso
    
    init() {
        self = .noQueso
    }
}

enum IngredientesPizza : Int{
    case Jamón, Pepperoni, Pavo, Salchicha, Aceituna, Cebolla, Pimineto, Piña, Anchoa
}

class Pizza {
    var tamaño = TamañoPizza()
    var masa = MasaPizza()
    var queso = QuesoPizza()
    var ingredientes : [IngredientesPizza] = []
}
