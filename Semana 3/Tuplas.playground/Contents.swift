//: Playground - noun: a place where people can play

import UIKit

func calcularIndiceDeMasaCorporal ( pesoIntegral peso : Double, altura : Double) -> (imcCalculado: Double, mensajeDeSalida: String){
    
    let imc = peso / (altura * altura)
    var mensaje = ""
    if(imc > 18.50 && imc < 25.00){
        mensaje = "Peso normal"
    }else{
        mensaje = "Debes de acudir con tu médico"
    }
    
    let resultado = (imc, mensaje)
    
    return resultado
}

let resultadoIMC = calcularIndiceDeMasaCorporal(pesoIntegral: 89.0, altura: 1.80)

//let (imc,_) = calcularIndiceDeMasaCorporal(pesoIntegral: 89.0, altura: 1.80)
//let (_,mensaje) = calcularIndiceDeMasaCorporal(pesoIntegral: 89.0, altura: 1.80)
let (imc,mensaje) = calcularIndiceDeMasaCorporal(pesoIntegral: 89.0, altura: 1.80)

let imcTupla = calcularIndiceDeMasaCorporal(pesoIntegral: 89.0, altura: 1.80)
imcTupla.imcCalculado
imcTupla.mensajeDeSalida


resultadoIMC.0
resultadoIMC.1


var pelicula : (nombre: String, añoDeSalida : Int, calificacion: Double) = ("El TecTigre", 1990, 100.0)

