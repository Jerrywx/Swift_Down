//
//  JRMainViewController.swift
//  Swift-Down
//
//  Created by 王潇 on 2017/1/10.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

		/// 'setupChildControllers' is inaccessible due to 'private' protection level
        setupChildControllers()
    }
}

// MARK: - 设置界面
extension JRMainViewController {
	
	/// 创建所有字控制器
	func setupChildControllers() {
		
		let array = [
			["clsName":"JRBasicViewController", "title":"基础",   "imageName":"imageName"],
			["clsName":"JRCocoaViewController", "title":"Cocoa", "imageName":"imageName"],
			["clsName":"JRCoreViewController",	"title":"Core",  "imageName":"imageName"],
			["clsName":"JROtherViewController", "title":"其他",	 "imageName":"imageName"],
		]
		
		var arrayM = [UIViewController]()
		
		for dic in array {
			arrayM.append(controller(dic: dic))
		}
		
		viewControllers = arrayM
	}
	
	/// 使用字典创建一个子控制器
	///
	/// - Parameter dic: 字典信息 [clsName, title, imageName]
	/// - Returns: 子控制器
	private func controller(dic: [String : String]) -> UIViewController {
		
		/// 1. 获取字典数据
		guard
		let className	= dic["clsName"],
		let	title		= dic["title"],
		let imageName	= dic["imageName"],
		let cls			= NSClassFromString(Bundle.main.namespace + "." + className)
							as? UIViewController.Type
		else {
			return UIViewController()
		}
		
		/// 2. 创建实体控制器
		let vc	 = cls.init()
		vc.title = title
		vc.tabBarItem.image = #imageLiteral(resourceName: "tabbar_home")
//		vc.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar_home_selected").withRenderingMode(.alwaysOriginal)
		
		/// 自定义 TabBar 样式
//		vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)], for: .highlighted)
//		vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 14)], for: .normal)
		let nav  = UINavigationController(rootViewController: vc)

		return nav
	}
}


// MARK: - 知识点
extension JRMainViewController {
	
	/// 1. 修改项目名称
	/// 点击项目 -> TARGETS -> build setting -> 搜索 Product Name -> 修改&clean
	
	/// 2. 获取项目命名空间
	/// return infoDictionary!["CFBundleName"] as? String ?? ""
	
	/// 3. 使用字符串创建类
	/// let cls = NSClassFromString(Bundle.main.namespace + "." + className) as? UIViewController.Type
	
	/// 4. 注意
	/// 项目名称问题会导致获取类失败 返回 nil
	/// 'setupChildControllers' is inaccessible due to 'private' protection level
}

