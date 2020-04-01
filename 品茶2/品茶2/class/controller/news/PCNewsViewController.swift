//
//  PCNewsViewController.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/2.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PCNewsViewController: UIViewController {
    
    var tableView: UITableView?
    var arr: Array<Dictionary<String, String>>? = Array()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatArr()
        setTableView()
    }

    
}
//MARK: - 设置tableView及UITableViewDelegate , UITableViewDataSource
extension PCNewsViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "teaCell"
        let cell = PCNewsTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        Alamofire.request("http://api.tea.app887.com/api/Articles.action?opc=10&npc=0&type=%E8%B5%84%E8%AE%AF").responseJSON() {responds in
            if let value = responds.result.value {
                let json = JSON(value)
                
                //将这里需要的json数据赋值给cell.dict
                cell.dict["title"] = json["root"]["list"][indexPath.row]["title"].string
                cell.dict["time"] = json["root"]["list"][indexPath.row]["CTIME"].string
                cell.dict["url"] = json["root"]["list"][indexPath.row]["url"].string
                //将cell.dict赋值给arr,以arr传给web
                self.arr?[indexPath.row] = cell.dict
                //将得到的有值的字典设置到界面展示
                cell.titleLabel?.text = cell.dict["title"]
                cell.timeLable?.text = cell.dict["time"]
                
            }
        }
        return cell
    }
    //点击cell跳转到一个web
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let web: PCwebViewController = PCwebViewController()
        web.dict = arr?[indexPath.row]
        navigationController?.pushViewController(web, animated: true)
    }
    //tableView初始化和设置代理
    func setTableView() {
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.white
        view.addSubview(tableView!)
        
    }
    func creatArr() -> () {
        let dict = ["title" : "" , "time" : "" , "url" : ""]
        for _ in 0...200 {
            arr?.append(dict)
        }
    }
}
