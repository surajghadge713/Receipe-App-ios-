//
//  HomeViewController.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 19/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    let cellId = "cellId"
    var receipeDictionary : [Receipe] = []
    @IBOutlet weak var receipeCountBlock: UIView!
    
    @IBOutlet weak var receipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.topItem?.title = "";
        
        receipeDictionary = addReceipe()
    }
    
    func addReceipe() -> [Receipe] {
        var receipeDictionary : [Receipe] = []
        
        receipeDictionary.append(Receipe(receipeName: "Aloo gobi",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        receipeDictionary.append(Receipe(receipeName: "Biryani",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        receipeDictionary.append(Receipe(receipeName: "Chana masala",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        receipeDictionary.append(Receipe(receipeName: "Chicken Tikka",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        receipeDictionary.append(Receipe(receipeName: "Poha",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        receipeDictionary.append(Receipe(receipeName: "Gobhi matar",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        receipeDictionary.append(Receipe(receipeName: "Kadai paneer",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        receipeDictionary.append(Receipe(receipeName: "Kofta",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        receipeDictionary.append(Receipe(receipeName: "Lauki ke kofte",receipeComplexity: "Advanced",numberOfPersonViewed: 4,time: 45))
        
        return receipeDictionary
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewDidDisappear(_ animated: Bool) {
       //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}


extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receipeDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let receipe = receipeDictionary[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ReceipeCell
        cell.setReceipe(receipe: receipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: \(indexPath.row)")
        
        let receipeDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ReceipeDetailsVC") as! ReceipeDetailsVC
        self.navigationController?.pushViewController(receipeDetailsVC, animated: true)
        
//        let followersViewController = self.storyboard?.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController
//        self.navigationController?.pushViewController(followersViewController, animated: true)
    }
    
}
