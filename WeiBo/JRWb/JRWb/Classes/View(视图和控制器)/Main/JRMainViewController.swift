//
//  JRMainViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		setUpChildControllers()
    }
}

// MARK: - 设置主界面
extension JRMainViewController {
	
	/// 设置所有子控制器
	func setUpChildControllers() {
		
		let vcArray = [["clsName":"JRHomeViewController"	,"title":"首页","imageName":"tabbar_home"],
		               ["clsName":"JRMessageViewController"	,"title":"消息","imageName":"tabbar_message_center"],
		               ["clsName":"JRDiscoverViewController","title":"发现","imageName":"tabbar_discover"],
		               ["clsName":"JRProfileViewController"	,"title":"我的","imageName":"tabbar_profile"],
		               ]
		
		var arrayM = [UIViewController]()
		
		for dic in vcArray {
			arrayM.append(controler(dic: dic))
		}
		
		self.viewControllers = arrayM
	}
	
	/// 使用字典创建一个自控制器
	///
	/// - Parameter dic: 字典 [clsName, title, imageName] 
	/// - Returns: 自控制器
	private func controler(dic:[String : String]) -> UIViewController{
		
		guard
		
		let clsName		= dic["clsName"],
		let title		= dic["title"],
		let imageName	= dic["imageName"],
		let cls			= NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type

		else {
			return UIViewController()
		}
		
		print(title)
		print(imageName)
		print(cls)
		
		let vc   = cls.init()
		vc.title = title
		vc.tabBarItem.image = UIImage(named: imageName)
		vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
		let nav  = JRNavigationController(rootViewController: vc)
		
		return nav
	}
	
}
