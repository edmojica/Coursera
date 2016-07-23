//
//  MasaViewController.swift
//  PizzaApp
//
//  Created by Edson Mojica on 7/22/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import UIKit

class MasaViewController: UIViewController {

    var miPizza = Pizza()
    var masaPizza = MasaPizza()
    
    @IBOutlet weak var nextStep: UIButton!
    @IBOutlet weak var tipoMasaSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if masaPizza == .noMasa {
            nextStep.hidden = true
        }
    }

    override func viewWillAppear(animated: Bool) {
        tipoMasaSeg.selectedSegmentIndex = miPizza.masa.rawValue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func nuevaMasa(sender: UISegmentedControl) {
        if masaPizza.rawValue != sender.selectedSegmentIndex {
            masaPizza = MasaPizza(rawValue:sender.selectedSegmentIndex)!
            nextStep.hidden = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        miPizza.masa = masaPizza
        let nextVista = segue.destinationViewController as! QuesoViewController
        nextVista.miPizza = miPizza
    }

    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            // Your code...
            let stack = self.navigationController?.viewControllers.count
            let vista = self.navigationController?.viewControllers[stack! - 1] as! SizeViewController
            miPizza.masa = masaPizza
            vista.miPizza = miPizza
        }
    }
    
}
