//
//  PizzaListaWK.swift
//  PizzaWatch
//
//  Created by Edson Mojica on 07/08/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import WatchKit
import Foundation


class PizzaListaWK: WKInterfaceController {
    
    var pizza = PizzaWK()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let c = context as! PizzaWK
        self.pizza = c
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}