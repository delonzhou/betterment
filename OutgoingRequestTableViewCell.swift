//
//  OutgoingRequestTableViewCell.swift
//  betterment
//
//  Created by Mitul Manish on 10/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class OutgoingRequestTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var moneyOffering: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
