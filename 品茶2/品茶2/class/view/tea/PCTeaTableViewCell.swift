//
//  PCTeaTableViewCell.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/8.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import UIKit

class PCTeaTableViewCell: PCTableViewCell {

    
    var dict: Dictionary<String, String> = ["title" : "", "imglink_1" : "" , "imglink_2" : "" , "imglink_3" : "" , "time" : "" , "url" : ""]
    var titleLabel: UILabel?
    var imageView_1: UIImageView?
    var imageView_2: UIImageView?
    var imageView_3: UIImageView?
    var timeLable: UILabel?

    override func setUI() {
        titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: UIScreen.main.bounds.width - 10, height: 20))
        addSubview(titleLabel!)
        titleLabel?.text = dict["title"]
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        
        let imageViewY = CGFloat(30)
        let imageViewWidth = (UIScreen.main.bounds.width - 20) / 3
        let imageViewHeight = CGFloat(80)
        imageView_1 = UIImageView(frame: CGRect(x: 5, y: imageViewY, width: imageViewWidth, height: imageViewHeight))
        addSubview(imageView_1!)
        imageView_1?.image = UIImage(named: dict["imglink_1"]!)
        
        imageView_2 = UIImageView(frame: CGRect(x: 5 + imageViewWidth + 5, y: imageViewY, width: imageViewWidth, height: imageViewHeight))
        addSubview(imageView_2!)
        imageView_2?.image = UIImage(named: dict["imglink_2"]!)
        
        imageView_3 = UIImageView(frame: CGRect(x: 15 + imageViewWidth * 2, y: imageViewY, width: imageViewWidth, height: imageViewHeight))
        addSubview(imageView_3!)
        imageView_3?.image = UIImage(named: dict["imglink_3"]!)
        
        timeLable = UILabel(frame: CGRect(x: 5, y: imageViewY + imageViewHeight + 5, width: 150, height: 10))
        addSubview(timeLable!)
        timeLable?.text = dict["time"]
        timeLable?.font = UIFont.systemFont(ofSize: 10)
        timeLable?.textColor = UIColor.lightGray
        
        
    }
}
