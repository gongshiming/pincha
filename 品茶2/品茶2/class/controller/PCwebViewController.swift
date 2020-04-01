//
//  PCwebViewController.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/23.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import UIKit

class PCwebViewController: UIViewController {
    
    let webview: UIWebView = UIWebView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 69))
    var dict: Dictionary<String, String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webview)
        webview.backgroundColor = UIColor.white
        let url = URL(string: (dict?["url"])!)
        let request = URLRequest(url: url!)
        webview.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
