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
        
    }

}
