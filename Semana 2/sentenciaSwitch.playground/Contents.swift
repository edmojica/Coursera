//: Playground - noun: a place where people can play

import UIKit

var meses = 1...12
for mes in meses{
    
    switch mes{
    case 1,2,3:
        print("Mes templado")
    case 4...7:
        print("Mes caluroso")
    default:
        print("No conozco el clima")
    }
    
    /*
    if mes == 1{
        print("Enero")
    }else if mes == 2{
        print("Febrero")
    }else{
        print("Otros meses")
    }
 */
}