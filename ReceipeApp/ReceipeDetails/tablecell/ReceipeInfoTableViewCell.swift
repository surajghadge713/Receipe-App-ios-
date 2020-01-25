//
//  ReceipeInfoTableViewCell.swift
//  ReceipeApp
//
//  Created by Suraj Ghadge on 21/08/19.
//  Copyright © 2019 Suraj Ghadge. All rights reserved.
//

import UIKit

class ReceipeInfoTableViewCell: UITableViewCell , UIScrollViewDelegate {

    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var heart: UIImageView!
    
     var arrImages : [UIImage] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        arrImages = [UIImage(named: "roll.jpg"), UIImage(named: "2.jpg"), UIImage(named: "3.jpg"),UIImage(named: "4.jpg")] as! [UIImage]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadScrollView() {
        let pageCount = arrImages.count
        scrollView.frame = subview.bounds
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
        pageControl.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        for i in (0..<pageCount) {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: i * Int(scrollView.frame.size.width) , y: 0 , width:
                Int(scrollView.frame.size.width) ,height: Int(scrollView.frame.size.height))
            
            //print(subView.bounds)
            imageView.image = arrImages[i]
            self.scrollView.addSubview(imageView)
        }
        
        
        
        self.subview.addSubview(scrollView)
        
        let imageHeart = UIImageView()
        self.scrollView.addSubview(imageHeart)
        imageView!.image = UIImage(named: "heart.jpg")
        imageView!.translatesAutoresizingMaskIntoConstraints = false
        imageView!.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -20).isActive = true
        imageView!.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 20).isActive = true
        
        let width1 = (Float(arrImages.count) * Float(self.subview.frame.size.width))
        scrollView.contentSize = CGSize(width: CGFloat(width1), height: self.subview.frame.size.height)
        
        self.pageControl.addTarget(self, action: #selector(self.pageChanged(sender:)), for: UIControl.Event.valueChanged)
        
        self.subview.addSubview(pageControl)
    }
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        print("pageNumber:  \(pageNumber)")
    }
    
    @objc func pageChanged(sender:AnyObject)
    {
        let xVal = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: xVal, y: 0), animated: true)
        
    }
}
