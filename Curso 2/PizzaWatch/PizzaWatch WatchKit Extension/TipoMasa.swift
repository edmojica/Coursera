//
//  TipoMasa.swift
//  PizzaWatch
//
//  Created by Edson Mojica on 07/08/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import WatchKit
import Foundation

class TipoMasa: WKInterfaceController {
    
    @IBOutlet var pickerTipoMasa: WKInterfacePicker!
    var tiposMasa = ["Delgada", "Crujiente", "Gruesa"]
    var pizza = PizzaWK()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! PizzaWK
        self.pizza = c
        
        print("Resultado \(self.pizza.tamano)")
        
        // Configure interface objects here.
        let indiceInicial = 0
        var pickerItems: [WKPickerItem] = []
        for i in indiceInicial...(tiposMasa.count - 1) {
            let item = WKPickerItem()
            item.title = "\(tiposMasa[i])"
            pickerItems.append(item)
        }
        self.pickerTipoMasa.setItems(pickerItems)
        
        pizza.tipoMasa = tiposMasa.first
    }
    
    
    @IBAction func pickerChanged(value: Int) {
        pizza.tipoMasa = tiposMasa[value]
        print("Tipo Masa Pizza: \(pizza.tipoMasa)")
        
    }
    @IBAction func confirmar() {
        // Quitar el segue manual del storyboard y hacer uso de la función
        // pushControllerWithName
        pushControllerWithName("idTipoQueso", context: self.pizza)
    }
}

