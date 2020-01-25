//
//  StatisticTableViewCell.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 21/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {

    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var proteinView: UIView!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var carbsView: UIView!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var fatsView: UIView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var proteinViewWidth: NSLayoutConstraint!
    @IBOutlet weak var carbsViewWidth: NSLayoutConstraint!
    @IBOutlet weak var fatsViewWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setStatistics(dictionary : [String:Int]){
        proteinLabel.text = "\(String(describing: dictionary["Proteins"]!))%"
        carbsLabel.text = "\(String(describing: dictionary["Carbs"]!))%"
        fatsLabel.text = "\(String(describing: dictionary["Fat"]!))%"
        
        proteinViewWidth.constant = getWidth(value: dictionary["Proteins"]!)
        carbsViewWidth.constant = getWidth(value: dictionary["Carbs"]!)
        fatsViewWidth.constant = getWidth(value: dictionary["Fat"]!)
        
        self.roundCorners(view: proteinView)
        self.roundCorners(view: carbsView)
        self.roundCorners(view: fatsView)
        
    }
    
    fileprivate func getWidth(value : Int) -> CGFloat {
       return self.view.frame.width*(CGFloat(value)/100)
    }
    
    fileprivate func roundCorners(view :UIView){
        let corners: UIRectCorner = [.topLeft,.bottomLeft,.bottomRight, .topRight]
        let radius = 12.0
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }

}
