//
//  PCCultureTableViewCell.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/8.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import UIKit

class PCCultureTableViewCell: PCTableViewCell {

    var dict = ["title" : "" , "time" : "" , "url" : ""]
    var titleLabel: UILabel?
    var timeLable: UILabel?
    
    override func setUI() {
        titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: UIScreen.main.bounds.width - 10, height: 50))
        addSubview(titleLabel!)
        titleLabel?.text = dict["title"]
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        titleLabel?.numberOfLines = 0
        
        timeLable = UILabel(frame: CGRect(x: 5, y: 5 + 50 + 5, width: UIScreen.main.bounds.width - 10, height: 10))
        addSubview(timeLable!)
        timeLable?.text = dict["time"]
        timeLable?.textColor = UIColor.lightGray
        timeLable?.font = UIFont.systemFont(ofSize: 7)
        
    }


}
