//
//  SkillTableViewCell.swift
//  betterment
//
//  Created by Mitul Manish on 23/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {
    
    @IBOutlet weak var skillNameLabel: UILabel!
    
    @IBOutlet weak var hourlyRateLabel: UILabel!
    
    
    @IBOutlet weak var experienceLabel: UILabel!
    
    @IBOutlet weak var skillImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
