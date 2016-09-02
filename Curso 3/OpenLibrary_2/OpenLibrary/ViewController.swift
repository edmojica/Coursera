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
    //@IBOutlet weak var ResultViewText: UITextView!
    @IBOutlet weak var titulo: UITextView!
    @IBOutlet weak var autores: UITextView!
    @IBOutlet weak var portada: UIImageView!
    
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
        //self.ResultViewText.text = ""
        
    }
    
    func textFieldShouldReturn(SearchText: UITextField) -> Bool {
        
        SearchText.resignFirstResponder()
        asincrono(SearchText.text!)
        return true
    }
    
    func asincrono(isbn: String){

        let link = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn)"
        let url = NSURL(string: link)
        let datos = NSData(contentsOfURL: url!)

        if datos != nil {
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let isb = "ISBN:\(isbn)"
                let dico1 = json as! NSDictionary
                if (dico1.count > 0) {
                    let dico2 = dico1.valueForKey(isb) as! NSDictionary
                    self.titulo.text =  dico2.valueForKey("title") as! NSString as String
                    //portada
                    if (dico2["cover"] != nil ) {
                        let dico3 = dico2.valueForKey("cover") as! NSDictionary
                        let rutaImagen = dico3.valueForKey("small") as! NSString as String
                        let urlImagen :NSURL = NSURL(string: rutaImagen)!
                        let dataImage:NSData = NSData(contentsOfURL:urlImagen)!
                        portada.image = UIImage(data: dataImage)
                    }
                    //autores
                    var dico4 = dico2.valueForKey("authors") as! [NSDictionary]
                    self.autores.text = dico4.removeAtIndex(0).valueForKey("name")! as! String
                }else{
                    let alertController = UIAlertController(title: "Error", message: "ISBN introduccido no existe.", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
            catch _ {

            }
        }else {
            let alertController = UIAlertController(title: "Error", message: "Se ha presentado un problema de conexión con el server. Revisa tu conexión a internet y vuelve a intentarlo.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true);
        
    }
    
}


