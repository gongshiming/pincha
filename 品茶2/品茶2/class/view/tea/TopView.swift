//
//  TopView.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/2.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import UIKit
protocol TopViewDelegate: NSObjectProtocol {
    func buttonClicked(button: UIButton)
}
class TopView: UIView {
    weak var topViewDelegate: TopViewDelegate?
    
    var arrayButton: [UIButton] = [UIButton]()

    func set() {
        backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
        let width =  UIScreen.main.bounds.width
        frame = CGRect(x: 0, y: 0, width: width, height: 64)
        let w: CGFloat = width / 6
        let h: CGFloat = 44
        for i in 0...5 {
            let button = UIButton(frame: CGRect(x: (CGFloat(Float(i)) * w), y: 20, width: w, height: h))
            arrayButton.insert(button, at: i)
            addSubview(button)
            var title: String
            switch i {
            case 0:
                title = "普洱"
            case 1:
                title = "黑茶"
            case 2:
                title = "红茶"
            case 3:
                title = "绿茶"
            case 4:
                title = "乌龙"
            case 5:
                title = "白茶"
            default:
                return
            }
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(UIColor.black, for: .normal)
            button.tag = 100 + i
            button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        }
        arrayButton[0].setTitleColor(UIColor.red, for: .normal)
    }
    @objc func buttonClicked(_ button: UIButton) {
        for btn in arrayButton {
            btn.setTitleColor(UIColor.black, for: .normal)
        }
        button.setTitleColor(UIColor.red, for: .normal)
        
        topViewDelegate?.buttonClicked(button: button)
    }
}
