//
//  ViewController.swift
//  Snapchat Menu
//
//  Created by 王潇 on 2017/2/9.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	/// 属性
	let leftVC   = SideViewController()
	let centerVC = CenterViewController()
	let rightVC  = SideViewController()
	
	let scrollView: UIScrollView = UIScrollView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
}

// MARK: - 初始化界面
extension ViewController {
	
	/// 初始化界面
	fileprivate func setupUI() {
		/// 隐藏状态栏
		UIApplication.shared.isStatusBarHidden = true
		/// 设置 ScrollView
		scrollView.frame = self.view.bounds
		scrollView.contentSize = CGSize(width: view.bounds.size.width * 3, 
		                                height: view.bounds.size.height)
		scrollView.isPagingEnabled = true
		view.addSubview(scrollView)
		
		/// 添加子控制器
		addControllers()
	}
	
	/// 添加子控制器
	private func addControllers() {
		leftVC.view.backgroundColor   = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
		centerVC.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
		rightVC.view.backgroundColor  = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
		
		self.addChildViewController(leftVC)
		self.addChildViewController(centerVC)
		self.addChildViewController(rightVC)
		
		centerVC.view.frame.origin.x = UIScreen.main.bounds.size.width
		rightVC.view.frame.origin.x = UIScreen.main.bounds.size.width * 2
		
		scrollView.addSubview(leftVC.view)
		scrollView.addSubview(centerVC.view)
		scrollView.addSubview(rightVC.view)
		
		leftVC.imageView.image = #imageLiteral(resourceName: "left")
		rightVC.imageView.image = #imageLiteral(resourceName: "right")
	}
}

