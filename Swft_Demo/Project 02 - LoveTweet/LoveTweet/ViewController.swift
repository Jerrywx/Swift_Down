//
//  ViewController.swift
//  LoveTweet
//
//  Created by 王潇 on 2017/2/12.
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
	
	fileprivate func setupUI() {
		
		let centerX = self.view.bounds.size.width * 0.5
		let title = UILabel()
		title.text = "LoveTweet"
		title.sizeToFit()
		title.center = CGPoint(x: centerX, y: 80)
		title.font = UIFont(name: "System", size: 17)
		view.addSubview(title)
	}
	
}
