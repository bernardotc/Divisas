//
//  ViewController.swift
//  Divisas
//
//  Created by alumno on 8/11/16.
//  Copyright © 2016 bernardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfTypeOfChange: UITextField!
    @IBOutlet weak var tfPesos: UITextField!
    @IBOutlet weak var tfDollars: UITextField!
    @IBOutlet weak var viewImageDollars: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewImageDollars.image = UIImage(named: "dollarSign")
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action methods
    
    @IBAction func calculate(sender: UIButton) {
        let typeOfChange = Double(tfTypeOfChange.text!)
        let pesos = Double(tfPesos.text!)
        if typeOfChange != nil && pesos != nil {
            let dollars = pesos! / typeOfChange!
            tfDollars.text! = String(format: "%0.2f", dollars)
        } else {
            let alert = UIAlertController(title: "Error en los datos", message: "Todos los campos deben tener valor numérico.", preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func quitaTeclado() {
        view.endEditing(true)
    }

}