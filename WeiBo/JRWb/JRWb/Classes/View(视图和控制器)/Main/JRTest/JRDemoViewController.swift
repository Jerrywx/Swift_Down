//
//  JRDemoViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/14.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRDemoViewController: JRBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		navigationItem.title = "第\(navigationController?.childViewControllers.count ?? 0)个"
    }
	
	@objc fileprivate func nextVC() {
		navigationController?.pushViewController(JRDemoViewController(), animated: true)
	}
}

// MARK: - 扩展测试控制器
extension JRDemoViewController {
	
	override func setupUI() {
		super.setupUI()
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个",
		                                                    target: self,
		                                                    action: #selector(nextVC))
	}
}
