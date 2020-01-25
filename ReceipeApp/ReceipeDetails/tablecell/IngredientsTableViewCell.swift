//
//  IngredientsTableViewCell.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 21/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setIngredient(value : String){
        ingredientLabel.backgroundColor = UIColor.lightGray
        ingredientLabel.text = value
    }

}
