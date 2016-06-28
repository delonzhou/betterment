//
//  TableViewCell.swift
//  betterment
//
//  Created by Mitul Manish on 20/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class FourSquareTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
