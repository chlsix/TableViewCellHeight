//
//  ViewController.swift
//  TableViewCellHeight
//
//  Created by 陈磊 on 16/1/13.
//  Copyright © 2016年 ShenSu. All rights reserved.
//

import UIKit

let myTableViewCellId = "myTableViewCellId"
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    var dataSource:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource = NSMutableArray()//数组初始化
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.estimatedRowHeight = 100//预估高度
        self.myTableView.rowHeight = UITableViewAutomaticDimension//iOS8.0之后是默认值，不用再设置
        self.myTableView!.registerNib(UINib(nibName: "MyTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: myTableViewCellId)//注册cell
        
        self.getData()//数据加载
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource, UITableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(myTableViewCellId) as! MyTableViewCell
        cell.firstLable.text = dataSource[indexPath.row].valueForKey("str1") as? String
        cell.secondLabel.text = dataSource[indexPath.row].valueForKey("str2") as? String
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    //MARK: 得到数据
    func getData() {
        let path = NSBundle.mainBundle().pathForResource("dataList", ofType: "json")
        let data = NSData(contentsOfURL: NSURL(fileURLWithPath: path!))
        let dic = try!NSJSONSerialization.JSONObjectWithData(data!
                , options: NSJSONReadingOptions.AllowFragments)
        self.dataSource.addObjectsFromArray(dic.valueForKey("data")! as! [AnyObject])
        self.myTableView.reloadData()
    }



}

