//
//  Valor.swift
//  CalcIMCAW
//
//  Created by Edson Mojica on 29/07/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import WatchKit

class Valor: NSObject {
    var descripcion:String=""
    var valorIMC:Float=0
    
    init(d:String, v:Float){
        descripcion = d
        valorIMC = v
    }
}
