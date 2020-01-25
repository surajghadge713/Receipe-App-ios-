//
//  ReceipeDetailsVCViewController.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 20/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class ReceipeDetailsVC: UIViewController, UIScrollViewDelegate {

    var arrImages : [UIImage] = []
    let ingredientCell = "ingredientCell"
    
    let receipeInfoTableViewCell = "ReceipeInfoTableViewCell"
    let ingredientsTableViewCell = "IngredientsTableViewCell"
    let directionTableViewCell = "DirectionTableViewCell"
    let statisticTableViewCell = "StatisticTableViewCell"
    let commentsTableViewCell = "CommentsTableViewCell"
    
    var currentSection : String = "Ingredients"
    
    let profile = "Profile"
    let ingredients = "Ingredients"
    let directions = "Directions"
    let statistics = "Statistics"
    let comments = "Comments"
    
    
    let arrSections : [String] = ["","Ingredients","Directions","Statistics","Comments"]
    let arrSectionImage : [UIImage] = [UIImage(),UIImage(named: "cheese")!,UIImage(named: "direction")!,UIImage(named: "statistic")!,UIImage(named: "comment")!]
    
    let arrIncridient :[String] = ["1 1/2 pounds salmon fillets","lemon pepper to taste",
    "garlic powder to taste","salt to taste", "1/3 cup soy sauce","1/3 cup brown sugar","1/3 cup water",
    "1/4 cup vegetable oil"]
    
    let arrDirection :[String] = ["Season salmon fillets with lemon pepper, garlic powder and salt",
                                  "In a small bowl, stir together soy sauce, brown sugar, water and vegitable oil until sugar is dissolved. Place fish in a large resealable plastic bag with the soy sauce mixture, seal and turn to coat, Refrigrate for at least 2 hours.",
                                   "Preheat grill for medium heat",
                                   "Lightly oil grill grate. Place salmon on the preheated grill, and discard marinade. Cook salmon for 6 to 8 minutes per side or until the fish flasks easily a fork."]
    
    let arrStatistics  = ["Proteins":27,"Carbs":18,"Fat":55]
    

    @IBOutlet weak var ingredientTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrImages = [UIImage(named: "roll.jpg"), UIImage(named: "roll.jpg"), UIImage(named: "roll.jpg")] as! [UIImage]
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = "";
        self.navigationItem.title = "Details"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
    }
    
    override func viewDidLayoutSubviews() {
        //self.loadScrollView()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension ReceipeDetailsVC : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSections.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return arrSections[section]
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = UIColor.white
            let label = UILabel()
            label.text = arrSections[section]
            label.textColor = UIColor.black
            label.font = UIFont.systemFont(ofSize: 18,weight: .semibold)
            headerView.addSubview(label)

            let image = UIImageView(image: arrSectionImage[section])
            headerView.addSubview(image)

            //Set Image and  Label Constraints
            image.translatesAutoresizingMaskIntoConstraints = false
            image.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
            image.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            image.clipsToBounds = true
            image.contentMode = .scaleAspectFit
            image.widthAnchor.constraint(equalToConstant: 20).isActive = true
            image.heightAnchor.constraint(equalToConstant: 20).isActive = true

            label.translatesAutoresizingMaskIntoConstraints = false
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true

            return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
//        self.ingredientTableView.sectionHeaderHeight = UITableView.automaticDimension
//        self.ingredientTableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        print("heightForHeaderInSection : \(section)")
        if section == 0 {
            return 0
        }
        else{
             return 50
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("numberOfRowsInSection \(section) currentSection \(currentSection)")
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return arrIncridient.count
        }
        else if section == 2{
            return arrDirection.count
        }
        else if section == 3 {
             return 1
        }
        else if section == 4 {
            return 3
        }
        else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("indexpath: \(indexPath) : dimentions : \(UITableView.automaticDimension)")
//        tableView.estimatedRowHeight = 300
//        tableView.rowHeight = UITableView.automaticDimension
        //user profile and image slider
        if(indexPath.section == 0){
            return self.view.frame.size.height*0.44
        }
        //comment sections
        else if indexPath.section == 3 {
            return self.view.frame.size.height*0.30
        }
        else{
            return UITableView.automaticDimension
        }

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if(indexPath.section == 0){
            let cell : ReceipeInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: receipeInfoTableViewCell, for: indexPath) as! ReceipeInfoTableViewCell
            cell.scrollView.delegate = self
            cell.loadScrollView()
            return cell
        }
        else if(ingredients == arrSections[indexPath.section]){
            let cell : IngredientsTableViewCell = tableView.dequeueReusableCell(withIdentifier: ingredientsTableViewCell, for: indexPath) as! IngredientsTableViewCell
            cell.textLabel?.text = arrIncridient[indexPath.row]
            return cell
        }
        else if(directions == arrSections[indexPath.section]){
            let cell : DirectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: directionTableViewCell, for: indexPath) as! DirectionTableViewCell
            cell.setDirection(position: indexPath.row, value: arrDirection[indexPath.row])
            return cell
        }
        else if(statistics == arrSections[indexPath.section]){
            let cell : StatisticTableViewCell = tableView.dequeueReusableCell(withIdentifier: statisticTableViewCell, for: indexPath) as! StatisticTableViewCell
            cell.setStatistics(dictionary: arrStatistics)
            return cell
        }
        else if(comments == arrSections[indexPath.section]){
            let cell : CommentsTableViewCell = tableView.dequeueReusableCell(withIdentifier: commentsTableViewCell, for: indexPath) as! CommentsTableViewCell
            cell.statusLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
   
}
