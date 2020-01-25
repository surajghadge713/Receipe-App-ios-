//
//  DirectionTableViewCell.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 21/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class DirectionTableViewCell: UITableViewCell {

    @IBOutlet weak var directionStep: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDirection(position : Int , value : String){
        directionStep.text = "\(position + 1)"
        directionLabel.text = value
    }

}
