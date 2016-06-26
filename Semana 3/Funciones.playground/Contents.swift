//: Funciones

import UIKit

var str = "Hello, playground"

func calcularIMC(peso : Double, altura : Double) -> Double{
    //var peso = 60.0
    //var altura = 1.6
    let imc = peso / (altura * altura)
    //print(imc)
    return imc
}

calcularIMC(60.0, altura: 1.6)
calcularIMC(78.0, altura: 1.78)
