//
//  MasterDetailTableViewCell.swift
//  betterment
//
//  Created by Mitul Manish on 19/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class MasterDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
