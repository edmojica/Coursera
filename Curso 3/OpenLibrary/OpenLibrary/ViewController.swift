//
//  ViewController.swift
//  OpenLibrary
//
//  Created by Edson Mojica on 27/08/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var SearchText: UITextField!
    @IBOutlet weak var ResultViewText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ClearAcction(sender: AnyObject) {
        
        self.SearchText.text = ""
        self.ResultViewText.text = ""
        
    }
    
    //
    //Esconde teclado si tocas pantalla.
    //
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true);
        
    }
    
    //
    // Presionas "ENTER" se esconde el teclado. (Por metodo de Delegacion)
    // Mirar que en la clase ViewControler tiene UITextFieldDelegate
    // Cada caja de Texto tiene que tener el delegate del viewController
    //
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        buscar()
        
        textField.resignFirstResponder();
        return false;
        
    }
    
    func buscar(){
        
        if (self.SearchText.text != nil && self.SearchText.text != "") {
            
            let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
            
            let url = NSURL(string:urls + self.SearchText.text!)
            
            let datos:NSData? = NSData(contentsOfURL: url!)
            
            if (datos != nil) {
                
                let resultado = NSString(data: datos!, encoding: NSUTF8StringEncoding)
                
                if (resultado != "{}") {
                    
                    self.ResultViewText.text = resultado! as String
                    
                }
                else {
                    
                    let titulo = "Not Found"
                    let mensaje = "ISBN not found in https://openlibrary.org/"
                    let boton = "Ok"
                    
                    let alertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: boton, style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                    self.SearchText.text = ""
                    self.ResultViewText.text = ""
                    
                }
                
            }
            else {
                
                let titulo = "Connection Error"
                let mensaje = "Connection Error"
                let boton = "Ok"
                
                let alertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: boton, style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                self.SearchText.text = ""
                self.ResultViewText.text = ""
                
            }
            
        }
        else {
            
            let titulo = "Not Found"
            let mensaje = "You need an ISBN"
            let boton = "Ok"
            
            let alertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: boton, style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            self.SearchText.text = ""
            self.ResultViewText.text = ""
            
        }// End if
        
    }
    
}


