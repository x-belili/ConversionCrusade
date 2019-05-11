//
//  PersonalizedTableViewCell.swift
//  ConversionCrusade
//
//  Created by Mac Tecsup on 11/05/19.
//  Copyright © 2019 Belili Company. All rights reserved.
//

import UIKit

class PersonalizedTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var kilometerText: UILabel!
    
    @IBOutlet weak var yardsText: UILabel!
    
    @IBOutlet weak var milesText: UILabel!
    
}
