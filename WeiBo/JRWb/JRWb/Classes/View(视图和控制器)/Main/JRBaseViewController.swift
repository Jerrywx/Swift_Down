//
//  JRBaseViewController.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class JRBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		setupUI()
    }
}

// MARK: - 界面设置
extension JRBaseViewController {
	
	func setupUI() {
		view.backgroundColor = UIColor.cz_random()
	}	
}
