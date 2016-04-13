//
//  BaseViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/10.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, VisitorViewDelegate {

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
		// 1. 初始化未登录界面
		let customView = VisitorView()
		customView.delegate = self
		view = customView
		visitorView = customView
		// 2. 
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BaseViewController.registerButtonDidClicked))
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BaseViewController.loginButtonDidClicked))
	}
	
	// MARK: - VisitorViewDelegate
	// 登录事件
	func loginButtonDidClicked() {
//		print(#function)
		let loginNac: UINavigationController = UINavigationController(rootViewController: OAuthViewController())
		presentViewController(loginNac, animated: true, completion: nil)
	}
	// 注册事件
	func registerButtonDidClicked() {
		print(#function)
	}
}













