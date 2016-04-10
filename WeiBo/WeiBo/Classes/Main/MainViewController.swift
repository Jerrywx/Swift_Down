//
//  MainViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/10.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		/**
		添加左右子控制器
		*/
		addChildViewControllers()
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		// 初始化加号按钮
		setupComposeBtn()
	}
	
	private func addChildViewControllers() {
		// 1. 读取配置文件
		let jsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
		let jsonData = NSData(contentsOfFile: jsonPath!)
		// 2. 解析配置文件
		do {
			// 使用 try/catch 捕获异常
			let dictArray = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
			// 遍历数组 必行明确数组的类型
			for dict in dictArray as! [[String: String]] {
				addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
			}
		} catch {
			addChildViewController("HomeViewController",	 title: "首页", imageName: "tabbar_home")
			addChildViewController("MessageViewController",	 title: "消息", imageName: "tabbar_message_center")
			
			addChildViewController("NullViewController",	 title: "", imageName: "")
			
			addChildViewController("DiscoverViewController", title: "发现", imageName: "tabbar_discover")
			addChildViewController("ProfileViewController",  title: "我",   imageName: "tabbar_profile")
		}
	}
	
	/**
	初始化子控制器
	
	- parameter childController: 自控制权
	- parameter title:           标题
	- parameter imageName:       图片名称
	*/
	private func addChildViewController(childControllerName: String, title: String, imageName: String) {
		
		// 0. 动态获取命名空间
		let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
		print("命名空间: \(nameSpace)")
		
		// 2. 根据类名创建子控制器类
		let childClass:AnyClass = NSClassFromString(nameSpace + "." + childControllerName)!
		let childType = childClass as! UIViewController.Type
		let childVC = childType.init()
		
		// 3. 设置 tabBar 属性
		childVC.title = title
		childVC.tabBarItem.image = UIImage(named: imageName)
		childVC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
		tabBar.tintColor = UIColor.orangeColor()
		
		// 4. 创建导航控制器
		let childNav = UINavigationController(rootViewController: childVC)
		addChildViewController(childNav)
	}
	
	/**
	设置加号按钮
	*/
	func setupComposeBtn() {
		// 0. 添加加号按钮到 tabBar 上
		tabBar.addSubview(composeBtn)
		// 1. 计算加号按钮宽度
		let width = tabBar.bounds.width / CGFloat(viewControllers!.count)
		// 2. 创建按钮 frame
		let frame = CGRect(x: 0, y: 0, width: width + 2, height: tabBar.bounds.height)
		// 3. 设置按钮 frame 和 偏移位置
		composeBtn.frame = CGRectOffset(frame, width * 2, 0)
	}
	
	/**
	监听加好按钮点击
	注意: 运行循环监听到事件后, 向VC发送消息, 动态执行 方法，因此不能设置为 private
	*/
	func composeBtnClick() {
		print(#function)
	}
	
	// MARK: - 懒加载
	private lazy var composeBtn: UIButton = {
		// 1. 创建按钮
		let button = UIButton()
		// 2. 设置图片
		button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
		button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Selected)
		button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
		button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Selected)
		// 3. 监听加好按钮点击
		button.addTarget(self, action: #selector(MainViewController.composeBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
		// 4. 返回按钮
		return button
	}()
}




















