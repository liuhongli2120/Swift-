//
//  ListTableViewController.swift
//  Swift 私人通讯录
//
//  Created by 刘宏立 on 16/6/28.
//  Copyright © 2016年 lhl. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    //刷新联系人列表需要实例化一个数组
    //只是定义了一个数组,分配了地址,但是是一个空数组
    var personList = [Person]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //回调写完之后在这里调用
        loadData { (list) in
            print(list)
            
            //拼接数组,再闭包中,定义好的代码在需要的事后执行,需要 self.指定语境
            self.personList += list
            
            //刷新表格
            self.tableView.reloadData()
            
        }

        
    }
    
    private func  loadData(completion:(list: [Person])->()) -> () {
        DispatchQueue.global().async { 
            print("正在努力加载中...")
            
            Thread.sleep(forTimeInterval: 1)
            
            var arrayM = [Person]()
            
            //Swift里面,但凡在闭包里写的代码智能提示都会有问题
            for i in 0..<20{
                //创建Person
                let p = Person()
                
                p.name = "zhangsan - \(i)"
                
                //"%07d", 用来为号码  "占位"
                p.phone = "182" + String(format: "%07d", arc4random_uniform(1000000))
                p.title = "boss"
                
                //将 p 追加到数组
                arrayM.append(p)
                
            }
            //主线程回调,追加到数组后,主线程回调
            DispatchQueue.main.async(execute: {
                //执行闭包,执行闭包前要先设置闭包
                completion(list: arrayM)
                
            })
        }
    }
    
    //MARK: 数据源方法
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        //设置cell
        //这个地方两个 Label 的内容是不一样的,命名也不不一样,一个是 textLabel,一个是 detailTextLabel 
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        
        return cell
    }





}
