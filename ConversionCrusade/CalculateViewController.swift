//
//  CalculateViewController.swift
//  ConversionCrusade
//
//  Created by Mac Tecsup on 10/05/19.
//  Copyright © 2019 Belili Company. All rights reserved.
//

import UIKit
import CoreData

class CalculateViewController: UIViewController {

    @IBOutlet weak var measureK: UITextField!
    @IBOutlet weak var measureY: UITextField!
    @IBOutlet weak var measureM: UITextField!
    
    var typeMeasure: String?
    var quantityMeasure: String?
    
    func conexion () -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let quantity = Double(quantityMeasure!)
        
        if typeMeasure == "Kilómetros" {
            measureK.text = quantityMeasure
            measureM.text = "\(quantity!*0.62137)"
            measureY.text = "\(quantity!*1093.6100)"
            persistCalculate(k: quantityMeasure!, m: "\(quantity!*0.62137)", y: "\(quantity!*1093.6100)")
            
        } else if (typeMeasure == "Millas") {
            measureM.text = quantityMeasure
            measureK.text = "\(quantity!*0.62137)"
            measureY.text = "\(quantity!*1760.0)"
            persistCalculate(k: "\(quantity!*0.62137)", m: quantityMeasure!, y: "\(quantity!*1760.0)")
            
        } else if (typeMeasure == "Yardas") {
            measureY.text = quantityMeasure
            measureK.text = "\(quantity!*0.0009144)"
            measureM.text = "\(quantity!*0.00056818)"
            persistCalculate(k: "\(quantity!*0.0009144)", m: "\(quantity!*0.00056818)", y: quantityMeasure!)
            
        } else {
            measureK.text = quantityMeasure
            measureM.text = quantityMeasure
            measureY.text = quantityMeasure
        }
        
    }
    
    func persistCalculate(k:String, m:String, y:String) {
        let contexto = conexion()
        let entityRecord = NSEntityDescription.entity(forEntityName: "Record", in: contexto)
        let newRecord = NSManagedObject(entity: entityRecord!, insertInto: contexto)
        newRecord.setValue(k, forKey: "kilometer")
        newRecord.setValue(m, forKey: "miles")
        newRecord.setValue(y, forKey: "yards")
        
        do {
            try contexto.save()
        } catch let error as NSError {
            print("error save", error)
        }


    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
