//
//  ViewController.swift
//  ConversionCrusade
//
//  Created by Mac Tecsup on 10/05/19.
//  Copyright © 2019 Belili Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerTextField: UITextField!
    @IBOutlet weak var quantityMeasure: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    let salutations = ["", "Millas", "Yardas", "Kilómetros"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerTextField.inputView = pickerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pickerTextField.text = ""
        quantityMeasure.text = ""
        
    }
    
    @IBAction func calculateTapped(_ sender: UIButton) {

    }
    
    @IBAction func recordTapped(_ sender: UIButton) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "calculate" ) {
            let calculateVC = segue.destination as! CalculateViewController
            calculateVC.typeMeasure = pickerTextField.text
            calculateVC.quantityMeasure = quantityMeasure.text
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return salutations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return salutations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = salutations[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

