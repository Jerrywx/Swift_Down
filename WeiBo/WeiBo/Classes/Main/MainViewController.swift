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
		// 1. 设置 tabBar 颜色
		tabBar.tintColor = UIColor.orangeColor()
		// 2. 添加子控制器
		addChildViewController(HomeViewController(), title: "首页", imageName: "tabbar_home");
		addChildViewController(DiscoverViewController(), title: "发现", imageName: "tabbar_discover")
		addChildViewController(MessageViewController(), title: "消息", imageName: "tabbar_message_center")
		addChildViewController(ProfileViewController(), title: "我", imageName: "tabbar_profile")
    }

	/**
	初始化子控制器
	
	- parameter childController: 自控制权
	- parameter title:           标题
	- parameter imageName:       图片名称
	*/
	private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
		// 1. 初始化子控制器
		childController.tabBarItem.image = UIImage(named: imageName)
		childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
		childController.title = title
		// 2.
		let nav = UINavigationController(rootViewController: childController);
		addChildViewController(nav)
	}
}


















