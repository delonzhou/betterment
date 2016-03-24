//
//  WorkTableViewCell.swift
//  betterment
//
//  Created by Mitul Manish on 23/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class WorkTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var workImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
