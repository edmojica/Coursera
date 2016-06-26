//: Playground - noun: a place where people can play

import UIKit

let ciudades = ["Cancun", "Guadalajara", "DF", "Monterrey"]

enum Ciudad : Int {
    
    //case Cancun, Guadalajara, DF, Monterrey
    case Cancun = 450, Guadalajara = 10, DF = 78, Monterrey = 512
    
}

func obtenerCiudad(ciudad : Ciudad) -> String{
    switch ciudad {
    case .Cancun:
        return "Ciudad de playa"
    case .Guadalajara, .DF, .Monterrey :
        return "Ciudad sin playa"
    default:
        return "Opción Inválida"
    }
    
}

func calcularDistancia (ciudad:Ciudad) -> Int{
    
    return Ciudad.Cancun.rawValue - ciudad.rawValue
    
}

calcularDistancia(.Monterrey)
//obtenerCiudad(.Cancun)



