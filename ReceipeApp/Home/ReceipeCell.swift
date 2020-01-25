//
//  ReceipeCell.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 20/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class ReceipeCell: UITableViewCell {

    @IBOutlet weak var receipeName: UILabel!
    @IBOutlet weak var receipeComplexity: UILabel!
    @IBOutlet weak var numberOfPersonViewed: UILabel!
    @IBOutlet weak var time: UILabel!
    
    func setReceipe(receipe : Receipe){
        receipeName.text = receipe.receipeName
        receipeComplexity.text = receipe.receipeComplexity
        numberOfPersonViewed.text = "\(String(describing: receipe.numberOfPersonViewed!)) Persons"
        time.text = "\(String(describing: receipe.time!)) Minutes"
    }

}
