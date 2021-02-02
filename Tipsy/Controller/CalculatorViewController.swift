//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var percentValue : Double?
    var percentAsText: String?
    var finalBill : Double?
    
    override func viewDidLoad() {
        //dismiss keyboard wherever user press
        //Looks for single or multiple taps.
           let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

          //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
          //tap.cancelsTouchesInView = false

          view.addGestureRecognizer(tap)
    }
    


    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let safePercentValue = percentValue{
            
            let bill = Double(billTextField.text!)!
            let personsNumber = Double(splitNumberLabel.text!)!
            
            let tipPerPerson = bill * safePercentValue/personsNumber
        
            let billPerPerson = bill / personsNumber
            
            let finalBill = billPerPerson + tipPerPerson
           
            self.finalBill = finalBill
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
          
        }
      
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        deselectAllButtons()
        sender.isSelected = true
        percentAsText = sender.currentTitle
        if let perc = sender.currentTitle?.prefix(2) {
            if Double(perc)  != nil {
                percentValue = Double(perc)! / 100
            }else {
                percentValue = 0.0
            }
         
        }
    
    }
    
    func deselectAllButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            
            if self.finalBill != nil {
                resultVC.totalLabelValue = String(self.finalBill!)
                resultVC.settingsLabelText = "Split between \(splitNumberLabel.text!) people, with \(percentAsText!) tip."
            }
           
        }
    }
}

