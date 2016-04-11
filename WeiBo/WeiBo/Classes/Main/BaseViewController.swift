//
//  BaseViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/10.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

	// 登录状态
	var userLogin = false
	// 游客欢迎界面
	var visitorView:VisitorView?
	
	override func loadView() {
		userLogin ? super.viewDidLoad() : setupVisitorView()
	}
	
	/**
	创建未登陆界面
	*/
	private func setupVisitorView() {
		let customView = VisitorView()
		view = customView
		visitorView = customView
	}
}
