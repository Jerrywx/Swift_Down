//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Created by 王潇 on 2017/2/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	/// 属性
	var tableView:UITableView?
	
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
		view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
		/// 初始化TableView
		tableView = UITableView(frame: view.bounds, style: .grouped)
		tableView?.dataSource = self
		tableView?.delegate = self
		tableView?.rowHeight = 94
		tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		view.addSubview(tableView!)
		
	}
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		cell?.textLabel?.text = "asdas"
		return cell!
	}
	
}


