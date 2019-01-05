//
//  ViewController.swift
//  Lesson1Demo
//
//  Created by huangjianwu on 2019/1/5.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let label1 = UILabel(frame: CGRect(x: 10, y: 100, width: 300, height: 30))       //创建时设置frame
    let button1 = UIButton(frame: CGRect(x: 10, y: 300, width: 120, height: 40))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addLabel()
    }

    func addLabel()  {
        //添加到self.view上才会显示出来
        label1.text = "first label"
        self.view.addSubview(label1)
        
        //先创建，后设置frame
        let label2 = UILabel()
        label2.frame = CGRect(x: 10, y: 140, width: 300, height: 30)
        label2.text = "second label"
        self.view.addSubview(label2)
    }
    
    func setLabelAttribute() {
        //设置背景色
        label1.backgroundColor = UIColor.green
        
        //设置字体颜色
        label1.textColor = UIColor.red
        //设置字体大小
        label1.font = UIFont.systemFont(ofSize: 14)
        
        //设置文本对齐方式，默认左对齐
        label1.textAlignment = .right
        
        //设置要显示的文本
        label1.text = "I am a label"
        
        //打印label的文本,因为label.text为String？，所以要加！
        let labelString = label1.text!
        print(labelString)
    }
    
    func showMutableLineText() {
        //显示固定行数的文本
        label1.numberOfLines = 2;
        label1.text = "I am a label,I am a label,I am a label I am a label,I am a label,I am a label I am a label,I am a label,I am a label I am a label,I am a label,I am a label"
        
        //根据文字长度自己确定显示几行,只需设置numberOfLines = 0
        label1.numberOfLines = 0;
        label1.text = "I am a label,I am a label,I am a label I am a label,I am a label,I am a label I am a label,I am a label,I am a label I am a label,I am a label,I am a label I am a label,I am a label,I am a label I am a label,I am a label,I am a label I am a label,I am a label,I am a label I am a label,I am a label,I am a label"
    }
    
    func showAttributeString() {
        //创建富文本
        let attrString = NSMutableAttributedString(string: "I am a attributed string")
        //设置字体大小
        attrString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 18), range: NSMakeRange(0, 1))
        //设置字体颜色
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSMakeRange(2, 2))
        //设置下划线
        attrString.addAttribute(NSAttributedString.Key.underlineStyle, value:NSUnderlineStyle.single.rawValue, range: NSMakeRange(5,12))
        
        label1.attributedText = attrString
    }
    
    func addBtn()  {
        //显示文字
        button1.setTitle("普通状态", for: .normal)
        button1.setTitle("高粱状态", for: .highlighted)
        button1.setTitle("禁用状态", for: .disabled)
        //显示文字颜色
        button1.setTitleColor(UIColor.red, for: .normal)
        button1.setTitleColor(UIColor.blue, for: .highlighted)
        button1.setTitleColor(UIColor.cyan, for: .selected)
        button1.setTitleColor(UIColor.cyan, for: .disabled)
        //阴影文字颜色设置
        button1.setTitleShadowColor(UIColor.cyan, for: .normal)
        button1.setTitleShadowColor(UIColor.green, for: .highlighted)
        button1.setTitleShadowColor(UIColor.brown, for: .disabled)
        button1.setTitleShadowColor(UIColor.darkGray, for: .selected)
        
        button1.addTarget(self,action:#selector(methodName), for: .touchUpInside)
        button1.addTarget(self, action:#selector(someMethod(button:)), for:.touchUpInside)
    }
    
    func addBtnWithImage()  {
        //创建一个图片一个文字的按钮
        let btn2: UIButton = UIButton(type: .custom)
        btn2.frame = CGRect(x: 50, y: 100, width: 120, height: 35)
        btn2.setImage(UIImage(named: "1"), for: .normal)
        btn2.backgroundColor = UIColor.black
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn2.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        btn2.setTitle("图片按钮", for: .normal)
        //偏移量，分别为上下左右
        btn2.imageEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        btn2.titleEdgeInsets = UIEdgeInsets(top: 0, left: -80, bottom: 0, right: 5)
        btn2.setTitleColor(UIColor.white, for: .normal)
        btn2.adjustsImageWhenHighlighted = false
        self.view.addSubview(btn2)
    }
    
    //上
    @objc func methodName() {
        print("tapped")
    }
    
    //下
    @objc func someMethod(button:UIButton) {
        print("你是谁啊，其实就是一个按钮")
    }
    
    func addLongTextBtn() {
        let button = UIButton(frame:CGRect(x:20, y:50, width:130, height:50))
        button.setTitle("这个是一长长长长长长长长长长的文字", for:.normal) //普通状态下的文字
        button.setTitleColor(UIColor.white, for: .normal) //普通状态下文字的颜色
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.backgroundColor = UIColor.orange
        self.view.addSubview(button)
    }
    
    
    func addImageView() {
        //创建的时候直接设置图片
        let imageView = UIImageView(image:UIImage(named:"girl"))
        
        //先创建出对象再设置图片
        let imageView1 = UIImageView()
        imageView1.image = UIImage(named:"girl")
    }
    
    func imageFromLocalOrRemote() {
        //从文件目录中获取图片
        let path = Bundle.main.path(forResource:"girl", ofType: "png")
        let newImage = UIImage(contentsOfFile: path!)
        
        
        //网络地址获取图片
        let url = URL(string:"http://image.cnpp.cn/upload/images/20160905/09380421552_400x300.jpg")
        let data = try! Data(contentsOf: url!)
        let smallImage = UIImage(data: data)
        //imageView1.image = smallImage
        let imageView1 = UIImageView(image:smallImage)
    }
    
    
    func imageGif() {
        let imageView1 = UIImageView()
        //设置图片数组
        imageView1.animationImages = [UIImage(named:"2")!,UIImage(named:"3")!]
        
        //所有图片展示完一遍的总时长
        imageView1.animationDuration = 2
        
        //开始
        imageView1.startAnimating()
        
        //结束
        imageView1.stopAnimating()
        
        
        imageView1.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(ViewController.tapGestureRecognizer(sender:)))
        
        imageView1.addGestureRecognizer(tapGestureRecognizer)
        imageView1.layer.borderColor = UIColor.red.cgColor
        imageView1.layer.borderWidth = 2
        
        //圆角的设置
        imageView1.layer.cornerRadius = 150
        imageView1.layer.masksToBounds = true
    }

    
    @objc func tapGestureRecognizer(sender:UITapGestureRecognizer) {
        //code
    }
    
    func addTextfield() {
        let textField = UITextField(frame: CGRect(x:10, y:60, width:200, height:30))
        //设置边框样式为圆角矩形
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(textField)
    }
    
    func addTextfieldWithAttribute() {
        let textField = UITextField(frame: CGRect(x:10, y:60, width:200, height:30))
        //设置边框样式为圆角矩形
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(textField)
        
        //修改圆角半径的话需要将masksToBounds设为true
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 12.0  //圆角半径
        textField.layer.borderWidth = 2.0  //边框粗细
        textField.layer.borderColor = UIColor.red.cgColor //边框颜色
    }
    
    func addTextfieldView3()  {
        let textField = UITextField(frame: CGRect(x:10,y:160,width:200,height:30))
        //设置边框样式为圆角矩形
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        self.view.addSubview(textField)
    }
    

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        //打印出文本框中的值
        print(textField.text ?? "")
        return true
    }
}

