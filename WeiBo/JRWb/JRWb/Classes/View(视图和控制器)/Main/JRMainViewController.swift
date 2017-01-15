//
//  JRMainViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRMainViewController: UITabBarController {

	/// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setUpChildControllers()
		
		setupComposeButton()
    }
	
	// MARK: - 私有控件
	/// 撰写按钮
	lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add",
	                                                           backgroundImageName: "tabbar_compose_button")
	
	// FIXME: 发布微博功能未实现
	///
	func composeStatus() {
		print("发布微博功能")
		let vc = UIViewController()
		vc.view.backgroundColor = UIColor.cz_random()
		let navVC = UINavigationController(rootViewController: vc)
		present(navVC, animated: true, completion: nil)
	}
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return .portrait
	}
	
}

// MARK: - 设置主界面
extension JRMainViewController {
	
	/// 设置撰写按钮
	func setupComposeButton() {
		tabBar.addSubview(composeButton)
		/// 设置按钮的位置
		let count = CGFloat(childViewControllers.count)
		let w = tabBar.bounds.width / count - 1
		composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
		composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
	}
	
	/// 设置所有子控制器
	func setUpChildControllers() {
		
		let vcArray = [["clsName":"JRHomeViewController"	,"title":"首页","imageName":"tabbar_home"],
		               ["clsName":"JRMessageViewController"	,"title":"消息","imageName":"tabbar_message_center"],
		               ["clsName":"UIViewController"],
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
		
		/// 解包
		guard
		let clsName		= dic["clsName"],
		let title		= dic["title"],
		let imageName	= dic["imageName"],
		let cls			= NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
		else {
			return UIViewController()
		}
		
		/// 创建子控制器
		let vc   = cls.init()
		vc.title = title
		vc.tabBarItem.image			= UIImage(named: imageName)
		vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
		vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], for: .highlighted)
		
		/// 返回子控制器
		let nav  = JRNavigationController(rootViewController: vc)
		return nav
	}
	
}
