//
//  ViewController.swift
//  Lesson3Demo
//
//  Created by huangjianwu on 2019/1/5.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit

//添加代理
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //创建TableView
    var tableView = UITableView()
    var dataArr = NSMutableArray()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dataArr = ["1","2","3","4","5","6","7","8","9","10"]
        
        //初始化TableView
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
    }
    
    //Section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    //cell高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell";
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellID)
        
        cell.textLabel?.text = String(dataArr[indexPath.row] as! String)
        cell.detailTextLabel?.text = "test\(dataArr[indexPath.row])"
        
        
        
        return cell
    }
    
    
    //cell点击
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
        
        let alertController = UIAlertController(title: "提示", message: "这是第\(indexPath.row)个cell", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}
