//
//  SectionTableViewCell.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 23/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
