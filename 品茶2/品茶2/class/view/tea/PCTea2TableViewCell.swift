//
//  PCTea2TableViewCell.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/25.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import UIKit

class PCTea2TableViewCell: PCTableViewCell {

    var dict: Dictionary<String, String> = ["title" : "", "imglink_0" : "" , "time" : "" , "url" : ""]
    var titleLabel: UILabel?
    var imageView_0: UIImageView?
    var timeLable: UILabel?
    
    override func setUI() {
        let titleLabelWidth = (UIScreen.main.bounds.width - 10) / 3 * 2 - 50
        titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: titleLabelWidth, height: 75))
        addSubview(titleLabel!)
        titleLabel?.text = dict["title"]
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        titleLabel?.numberOfLines = 0
        
        let imageViewY = CGFloat(5)
        let imageViewWidth = (UIScreen.main.bounds.width - 20) / 3 + 50
        let imageViewHeight = imageViewWidth * 0.618
        imageView_0 = UIImageView(frame: CGRect(x: titleLabelWidth + 10, y: imageViewY, width: imageViewWidth, height: imageViewHeight))
        addSubview(imageView_0!)
        imageView_0?.image = UIImage(named: dict["imglink_0"]!)
        
        
        timeLable = UILabel(frame: CGRect(x: 5, y: imageViewY + imageViewHeight - 10, width: 150, height: 10))
        addSubview(timeLable!)
        timeLable?.text = dict["time"]
        timeLable?.font = UIFont.systemFont(ofSize: 10)
        timeLable?.textColor = UIColor.lightGray
        
        
    }
}
