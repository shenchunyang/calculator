//
//  ViewController.swift
//  calculator
//
//  Created by ry耷拉拉星球 on 16/6/27.
//  Copyright © 2016年 scy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var 显示: UITextField!
    var 计算器 = 计算()
    var 显示缓存 = ""
    var 缓存 = 0.0
    var 缓存2:Double?

    @IBAction func nine(sender: AnyObject) {
        按("9")
    }
    @IBAction func eight(sender: AnyObject) {
        按("8")
    }
    @IBAction func seven(sender: AnyObject) {
        按("7")
    }
    @IBAction func six(sender: AnyObject) {
        按("6")
    }
    @IBAction func five(sender: AnyObject) {
        按("5")
    }
    @IBAction func four(sender: AnyObject) {
        按("4")
    }
    @IBAction func three(sender: AnyObject) {
        按("3")
    }
    @IBAction func two(sender: AnyObject) {
        按("2")
    }
    @IBAction func one(sender: AnyObject) {
        按("1")
    }
    @IBAction func zero(sender: AnyObject) {
        按("0")
    }
    @IBAction func point(sender: AnyObject) {
        按(".")
    }
    @IBAction func add(sender: AnyObject) {
        计算器.设置当前算法(.加法)
        求值()
    }
    @IBAction func minus(sender: AnyObject) {
        计算器.设置当前算法(.减法)
        求值()
    }
    @IBAction func multiply(sender: AnyObject) {
        计算器.设置当前算法(.乘法)
        求值()
    }
    @IBAction func division(sender: AnyObject) {
        计算器.设置当前算法(.除法)
        求值()
    }
    @IBAction func 指数幂(sender: AnyObject) {
        计算器.设置当前算法(.指数幂)
        求值()

    }
    @IBAction func 清空当前算法(sender: AnyObject) {
        显示缓存 = ""
        显示.text="当前输入已撤销！"

        
    }
    @IBAction func 清空所有算法(sender: AnyObject) {
        显示缓存 = ""
        缓存 =  0.0
        缓存2=nil
        计算器.设置当前算法(.未选择)
        显示.text = ""
    }
    @IBAction func 结果(sender: AnyObject) {
        求值()
    }
    func 按(数字:String){
        
        显示缓存 += 数字
        显示.text = 显示缓存
        
    }
    func 求值(){
        var 结果 = ""
        if !显示缓存.isEmpty {
            let 临时 = 显示缓存 as NSString
            缓存 = 临时.doubleValue
            显示缓存 = ""
        }
        let 临时 = 缓存
        if let 前一个数字 = 缓存2 {
            结果 = 计算器.求结果(操作数: 前一个数字, 被操作数: 临时)
            显示.text = 结果
            let 临 = 结果 as NSString
            缓存2 = 临.doubleValue
            
        }else {
            缓存2 = 缓存
            缓存 = 0.0
        }
    }
    
    
}

