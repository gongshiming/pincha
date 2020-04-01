//
//  PCTeaViewController.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/2.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import UIKit
import AFNetworking
import SwiftyJSON
import Alamofire

class PCTeaViewController: UIViewController {

    let topview = TopView()
    var tableView: UITableView?
    var tea: String?
    var arr: Array<Dictionary<String, String>>? = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topview.topViewDelegate = self
        view.addSubview(topview)
        topview.set()
        creatArr()
        setTableView()        
    }
    
    
}
extension PCTeaViewController: TopViewDelegate {
    func buttonClicked(button: UIButton) {//点击了别的品种的茶，在这里更新字典信息
//        tea = button.titleLabel?.text
        tableView?.reloadData()
    }
}
//MARK: - 设置tableView及UITableViewDelegate , UITableViewDataSource
extension PCTeaViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
        return 103
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "teaCell"
        let cell = PCTea2TableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        var urlString = ""
        for button in topview.arrayButton {
            if (button.titleColor(for: .normal)?.isEqual(UIColor.red))! {
                switch (button.titleLabel?.text)! as String {
                case "普洱" :
                    urlString = "http://api.tea.app887.com/api/Articles.action?keyword=&npc=0&opc=20&type=%E6%99%AE%E6%B4%B1&uid=10528"
                case "黑茶" :
                    urlString = "http://api.tea.app887.com/api/Articles.action?keyword=&npc=0&opc=20&type=%E9%BB%91%E8%8C%B6&uid=10528"
                case "红茶" :
                    urlString = "http://api.tea.app887.com/api/Articles.action?keyword=&npc=0&opc=20&type=%E7%BA%A2%E8%8C%B6&uid=10528"
                case "绿茶" :
                    urlString = "http://api.tea.app887.com/api/Articles.action?keyword=&npc=0&opc=20&type=%E7%BB%BF%E8%8C%B6&uid=10528"
                case "乌龙" :
                    urlString = "http://api.tea.app887.com/api/Articles.action?keyword=&npc=0&opc=20&type=%e4%b9%8c%e9%be%99&uid=10528"
                case "白茶" :
                    urlString = "http://api.tea.app887.com/api/Articles.action?keyword=&npc=0&opc=20&type=%e7%99%bd%e8%8c%b6&uid=10528"

                default:
                    break
                }
            }
            
        }
        Alamofire.request(urlString).responseJSON() {responds in
            if let value = responds.result.value {
                let json = JSON(value)
                
                //将这里需要的json数据赋值给cell.dict
                cell.dict["title"] = json["root"]["list"][indexPath.row]["title"].string
                
                /*
                cell.dict["imglink_1"] = json["root"]["list"][indexPath.row]["imglink_1"].string
                cell.dict["imglink_2"] = json["root"]["list"][indexPath.row]["imglink_2"].string
                cell.dict["imglink_3"] = json["root"]["list"][indexPath.row]["imglink_3"].string
                */
                cell.dict["imglink_0"] = json["root"]["list"][indexPath.row]["imglink"].string

                cell.dict["time"] = json["root"]["list"][indexPath.row]["CTIME"].string
                cell.dict["url"] = json["root"]["list"][indexPath.row]["url"].string
                //将cell.dict赋值给arr,以arr传给web
                self.arr?[indexPath.row] = cell.dict
                //将得到的有值的字典设置到界面展示
                cell.titleLabel?.text = cell.dict["title"]
                
                /*
                if (cell.dict["imglink_1"] != nil) {
                    let url1 = URL(string:cell.dict["imglink_1"]!)
                    let data1 = try! Data(contentsOf: url1!)
                    cell.imageView_1?.image = UIImage(data: data1)
                }
                
                if (cell.dict["imglink_2"] != nil) {
                    let url2 = URL(string: cell.dict["imglink_2"]!)
                    let data2 = try! Data(contentsOf: url2!)
                    cell.imageView_2?.image = UIImage(data: data2)
                }
                
                if (cell.dict["imglink_1"] != nil) {
                    let url3 = URL(string: cell.dict["imglink_3"]!)
                    let data3 = try! Data(contentsOf: url3!)
                    cell.imageView_3?.image = UIImage(data: data3)
                }
                */
                
                if (cell.dict["imglink_0"] != nil) {
                    let url3 = URL(string: cell.dict["imglink_0"]!)
                    let data3 = try! Data(contentsOf: url3!)
                    cell.imageView_0?.image = UIImage(data: data3)
                }
                
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
    //tableView的初始化和代理设置
    func setTableView() {
        tableView = UITableView.init(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64 - 49))
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.white
        view.addSubview(tableView!)
        
    }
    func creatArr() -> () {
//        let dict = ["title" : "", "imglink_1" : "" , "imglink_2" : "" , "imglink_3" : "" , "time" : "" , "url" : ""]
        let dict: Dictionary<String, String> = ["title" : "", "imglink_0" : "" , "time" : "" , "url" : ""]

        for _ in 0...200 {
            arr?.append(dict)
        }
    }
}



