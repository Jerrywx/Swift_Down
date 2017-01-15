//
//  JRNavigationController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRNavigationController: UINavigationController {

	/// 重写 viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationBar.isHidden = true
	}
	
	/// 重写push 方法
	///
	/// - Parameters:
	///   - viewController: push控制器
	///   - animated: 是否动画
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {

		/// 判断是不是 root 控制器
		if childViewControllers.count > 0 {
			/// 隐藏tabBar
			viewController.hidesBottomBarWhenPushed = true
		}
		
		if let vc = viewController as? JRBaseViewController {
			
			var title = childViewControllers.first?.title ?? "返回"
			if childViewControllers.count > 1 {
				title = "返回"
			}
			vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, 
			                                               target: self, 
			                                               action: #selector(popToPresent))
		}
		
		/// 调用父类push
		super.pushViewController(viewController, animated: animated)
	}
	
	
	@objc private func popToPresent() {
		popViewController(animated: true)
	}

}
