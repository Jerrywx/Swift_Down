//
//  ViewController.swift
//  CustomFont
//
//  Created by 王潇 on 2017/2/8.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
	}
}

// MARK: - 初始化界面
extension ViewController {
	
	/// 初始化界面
	fileprivate func setupUI() {
		
		/// 设置背景色
		self.view.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.03529411765, blue: 0.06666666667, alpha: 1)
		/// 设置状态栏
		UIApplication.shared.statusBarStyle = .lightContent
		
	}
	
}
