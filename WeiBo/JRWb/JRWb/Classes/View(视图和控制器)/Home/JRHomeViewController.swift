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
		
//		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(myFrients))
		
		let button: UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
		button.addTarget(self, action: #selector(myFrients), for: .touchUpInside)
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
		
	}
}

