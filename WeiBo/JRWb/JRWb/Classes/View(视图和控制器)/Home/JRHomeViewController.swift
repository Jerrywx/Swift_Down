//
//  JRHomeViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRHomeViewController: JRBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	/// 好友
	@objc fileprivate func myFrients() {
		print(#function)
		let vc = JRDemoViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
}

// MARK: - 界面设置
extension JRHomeViewController {
	
	override func setupUI() {
		super.setupUI()
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(myFrients))
	}
}

