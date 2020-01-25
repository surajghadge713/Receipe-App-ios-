//
//  FollowersViewController.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 22/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeText(_ sender: UIButton) {
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"
    }
}
