//
//  ModeloIMC.swift
//  EjercicioPU
//
//  Created by Edson Mojica on 06/08/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import Foundation

class ModeloIMC{
    var peso:Float=0
    var estatura:Float=0
    
    func IMC() -> Float{
        var mc = peso/(estatura*estatura)
        mc = round(mc*100)/100
        return mc
    }
}
