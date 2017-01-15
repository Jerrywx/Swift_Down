//
//  JRBaseViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRBaseViewController: UIViewController {

	lazy var navBar = UINavigationBar(frame: CGRect(x: 0, 
	                                                y: 0, 
	                                                width: UIScreen.main.bounds.width, 
	                                                height: 64))
	
	lazy var navItem = UINavigationItem()
	
	override var title: String? {
		didSet {
			navItem.title = title
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		/// 初始化 UI
		setupUI()
		
    }
}

// MARK: - 界面设置
extension JRBaseViewController {
	
	func setupUI() {
		view.backgroundColor = UIColor.cz_random()
		view.addSubview(navBar)
		navBar.items = [navItem]
		
		navBar.barTintColor  = UIColor.cz_color(withHex: 0xF6F6F6)
	}	
}
