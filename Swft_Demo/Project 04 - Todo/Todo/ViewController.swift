//
//  ViewController.swift
//  Todo
//
//  Created by 王潇 on 2017/2/13.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
	}
}

extension ViewController {
	
	fileprivate func setupUI() {
		
		view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		title = "List"
		
		let leftBtn = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAct))
		navigationItem.leftBarButtonItem = leftBtn
		
		let rightBtn = UIBarButtonItem(title: "➕", style: .plain, target: self, action: #selector(addAct))
		navigationItem.rightBarButtonItem = rightBtn
		
	}
	
	@objc private func editAct() {
		print(#function)
	}
	
	@objc private func addAct() {
		print(#function)
		navigationController?.pushViewController(AddViewController(), animated: true)
	}
}

