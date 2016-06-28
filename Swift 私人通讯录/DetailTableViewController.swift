//
//  DetailTableViewController.swift
//  Swift 私人通讯录
//
//  Created by 刘宏立 on 16/6/28.
//  Copyright © 2016年 lhl. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    
    //实例化一个Person,然后连线
    var person: Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //判断Person是否有值,如果有值,设置UI
        if person != nil {
            nameText.text = person?.name
            phoneText.text = person?.phone
            titleText.text = person?.title
        }
        
    }

    @IBAction func savePerson(_ sender: AnyObject) {
        // 用 UI 更新person内容
        if person != nil {
            person?.name = nameText.text
            person?.phone = phoneText.text
            person?.title = titleText.text
            
            //更新之后返回上一级界面
            // Expression of type 'UIViewController?' is unused
            //方法的返回值没有使用
           _ = navigationController?.popViewController(animated: true)
        }
        
    }

}
