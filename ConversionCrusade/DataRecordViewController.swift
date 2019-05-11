//
//  DataRecordViewController.swift
//  ConversionCrusade
//
//  Created by Mac Tecsup on 11/05/19.
//  Copyright © 2019 Belili Company. All rights reserved.
//

import UIKit

class DataRecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var records : [Record] = []
    
    @IBOutlet weak var tableRecord: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableRecord.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            try records = context.fetch(Record.fetchRequest())
            tableRecord.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableRecord.dequeueReusableCell(withIdentifier: "cellRecord", for: indexPath) as? PersonalizedTableViewCell
        //let cell = UITableViewCell()
        let record = records[indexPath.row]
        cell?.kilometerText.text = record.kilometer
        cell?.milesText.text = record.miles
        cell?.yardsText.text = record.yards
        return cell!
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
