//
//  PCViewController.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/2.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import UIKit

class PCViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barTintColor = UIColor.clear
        
        addChildViewControllers()
    }
    
    
}

extension PCViewController {
    //TODO: - 添加 识茶、文化、资讯 三个子控制器
    func addChildViewController(vc: UIViewController , title: String , imageName: String) {
        addChildViewController(UINavigationController(rootViewController: vc))
        vc.title = title
        var image = UIImage(named: imageName)
        image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc.tabBarItem.image = image
    }
    func addChildViewControllers() {
        let teaVC = PCTeaViewController()
        addChildViewController(PCNavigationController(rootViewController: teaVC))
        teaVC.title = "识茶"
        var image1 = UIImage(named: "chagushi.jpg")
        image1 = image1?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        teaVC.tabBarItem.image = image1
        
        addChildViewController(vc: PCCultureViewController(), title: "文化", imageName: "茶知道30")
        addChildViewController(vc: PCNewsViewController(), title: "资讯", imageName:"茶情报30")
    }
}
