//
//  JRNavigationController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRNavigationController: UINavigationController {

	override func pushViewController(_ viewController: UIViewController, animated: Bool) {

		/// 判断是不是 root 控制器
		if childViewControllers.count > 0 {
			/// 隐藏tabBar
			viewController.hidesBottomBarWhenPushed = true
		}
		/// 调用父类push
		super.pushViewController(viewController, animated: animated)
	}

}
