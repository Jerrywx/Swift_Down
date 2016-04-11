//
//  BaseViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/10.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

	var isLogin = false
	
	override func loadView() {
		isLogin ? super.viewDidLoad() : setupVisitorView()
	}
	
	/**
	创建未登陆界面
	*/
	private func setupVisitorView() {
		let customView = VisitorView()
		view = customView
	}
	
}
