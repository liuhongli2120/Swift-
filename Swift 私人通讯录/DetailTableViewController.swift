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
    
    //更新完成回调
    //设置闭包属性
    //var completionCallBack: ()->()? //闭包的返回值是可选的
    
    //闭包是可选的
    var completionCallBack: (()->())?
    
    
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
            
            //执行闭包回调
            //这个地方 Xcode 会帮助修订为 ! 号,一定不要用 !, 要用?,如果闭包为nil就什么都不做,当没有修改时,保存的内用不变就会为空,这时候如果用 ! 就会崩溃
            completionCallBack?()
            
            //更新之后返回上一级界面
            // Expression of type 'UIViewController?' is unused
            //方法的返回值没有使用,返回值后修改保存的数据在上一级界面并不会变化,必须要刷新表格,即下一步要刷新表格
           _ = navigationController?.popViewController(animated: true)
        }
        
    }

}
